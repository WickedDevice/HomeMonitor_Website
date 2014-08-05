class BuildingsController < ApplicationController
  force_ssl unless Rails.env.development? || Rails.env.test?
  before_action :set_building, only: [:show, :edit, :update, :destroy]
  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = policy_scope Building.where(user_id: current_user.id).order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.csv {
        send_data(@buildings.to_csv,
                  filename: "CO2_by_building_#{Time.zone.now}.csv",
                  disposition: 'inline', type: "multipart/related")
      }
    end
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    respond_to do |format|
      format.html
      format.csv {
        send_data @building.to_csv,
                  filename: "#{@building.id}-#{@building.name}.csv",
                  disposition: 'inline', type: "multipart/related"
      }
    end
  end

  # GET /buildings/new
  def new
    @building = Building.new(user_id: session[:current_user_id])
    @devices = policy_scope Device.where(user_id: current_user.id)
    authorize @building
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)
    authorize @building
    success = @building.save
    edit_helper()

    success &= @building.save

    respond_to do |format|

      if success
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { @devices = policy_scope(Device.where(user_id: current_user.id)); render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|

      edit_helper()

      updated = @building.update(building_params)

      if updated
        format.html { redirect_to @building, notice: flash[:notice] || 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit, notice: 'Unable to update building.' }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def chart
    @building = Building.find(params[:id])
    authorize @building, :show?
    render :chart, formats: :csv
  end

  private

  def edit_helper
    success = true
    #Deals with special cases in forms

    #@building.request_only_devices(params[:building][:device_ids])
    @building.request_additional_devices(params[:building][:device_ids])
    if params[:building][:sensor_ids]
      Sensor.all.find(params[:building][:sensor_ids]).each do |sensor|
        sensor.activate(@building.id)
      end
    end
    puts "Params: #{params}"
    if params[:building][:start] == "now"
      if not @building.checkout_devices()
        success &= false
        flash[:notice] = "Unable to activate all sensors - some are in another building"
      end
      params[:building][:start] = Time.now
    end

    if params[:building][:end] == "now"
      @building.checkin_devices()
      params[:building][:end] = Time.now
    end


    #This code also smells...
    if params[:commit] == "Activate all"
      params[:building][:checkout] = "all"
    elsif params[:commit] == "Deactivate all"
      params[:building][:checkout] = "none"
    end

    if params[:building][:checkout] =="all"
      if not @building.checkout_devices()
        success &= false
        flash[:notice] = "Unable to activate all of the sensors - some are in another building"
      end
    elsif params[:building][:checkout]=="none"
      @building.checkin_devices()
    end

    #This code smells a bit...
    if params[:building][:device_buildings_locs] #locs is locations
      params[:building][:device_buildings_locs].each do |de_id, location|
        if de_id == "new" #Adds a location to the newly created device_building(s)
          params[:building][:device_buildings_locs][:new].each do |device_id, new_location|
            if de = DeviceBuilding.find_by(device_id: device_id, building_id: @building.id)
              de.location = new_location
              de.save
            end
          end
        else
          de = DeviceBuilding.find(de_id)
          de.location = location
          de.save
        end
      end
    end
    return success
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_building
    @building = Building.find(params[:id])
    authorize @building
    @devices = policy_scope Device.where(user_id: current_user.id)
    @sensors = policy_scope Sensor.where(user_id: current_user.id, activated: false)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def building_params
    params.require(:building).permit(:name, :location, :start, :end, :details,
                                     :co2_cutoff).merge(user_id: current_user.id)
    #{:device_ids => []}, # If this is included, ActiveRecord deletes the devices that don't have data submitted for them on update.
  end

end
