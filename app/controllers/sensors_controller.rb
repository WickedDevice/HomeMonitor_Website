class SensorsController < ApplicationController
  force_ssl unless Rails.env.development? || Rails.env.test?
  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = policy_scope Sensor.where(user_id: current_user.id).page(params[:page])
    #@sensors = Sensor
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
    respond_to do |format|
      format.html
    end
  end

  # GET /sensors/new
  def new
    @sensor = Sensor.new(user_id: session[:current_user_id])
    authorize @sensor
  end

  # GET /sensors/1/edit
  def edit
  end

  # POST /sensors
  # POST /sensors.json
  def create
    @sensor = Sensor.new(sensor_params)
    puts "Sensor Params #{sensor_params}"
    authorize @sensor
    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @sensor, notice: 'Sensor was successfully created.' }
        format.json { render :show, status: :created, location: @sensor }
      else
        format.html { render :new }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to @sensor, notice: 'Sensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.html { render :edit }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    @sensor.destroy
    respond_to do |format|
      format.html { redirect_to sensors_url, notice: 'Sensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
      authorize @sensor
      @sensor_datum = policy_scope(SensorDatum.where(user_id: current_user.id))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:id, :building_id, :name, :min_val, :max_val, :sensor_type).merge(user_id: current_user.id, device_id: params[:sensor_id] + params[:channel])
    end
end
