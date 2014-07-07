require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SensorDataController do

  # This should return the minimal set of attributes required to create a valid
  # SensorDatum. As you add validations to SensorDatum, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "ppm" => "1", "experiment_id" => "1", "device_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SensorDataController. Be sure to keep this updated too.
  let(:valid_session) { create_test_session() }

  describe "GET index" do
    it "assigns first 25 sensor_data as @sensor_data" do
      SensorDatum.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sensor_data).to_a.should eq(SensorDatum.all.limit(25).to_a)
    end
  end

  describe "GET show" do
    it "assigns the requested sensor_datum as @sensor_datum" do
      sensor_datum = SensorDatum.create! valid_attributes
      get :show, {:id => sensor_datum.to_param}, valid_session
      assigns(:sensor_datum).should eq(sensor_datum)
    end
  end

  describe "GET new" do
    it "assigns a new sensor_datum as @sensor_datum" do
      get :new, {}, valid_session
      assigns(:sensor_datum).should be_a_new(SensorDatum)
    end
  end

  describe "GET edit" do
    it "assigns the requested sensor_datum as @sensor_datum" do
      sensor_datum = SensorDatum.create! valid_attributes
      get :edit, {:id => sensor_datum.to_param}, valid_session
      assigns(:sensor_datum).should eq(sensor_datum)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SensorDatum" do
        expect {
          post :create, {:sensor_datum => valid_attributes}, valid_session
        }.to change(SensorDatum, :count).by(1)
      end

      it "assigns a newly created sensor_datum as @sensor_datum" do
        post :create, {:sensor_datum => valid_attributes}, valid_session
        assigns(:sensor_datum).should be_a(SensorDatum)
        assigns(:sensor_datum).should be_persisted
      end

      it "redirects to the created sensor_datum" do
        post :create, {:sensor_datum => valid_attributes}, valid_session
        response.should redirect_to(SensorDatum.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sensor_datum as @sensor_datum" do
        # Trigger the behavior that occurs when invalid params are submitted
        SensorDatum.any_instance.stub(:save).and_return(false)
        post :create, {:sensor_datum => { :ppm => "invalid value" }}, valid_session
        assigns(:sensor_datum).should be_a_new(SensorDatum)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SensorDatum.any_instance.stub(:save).and_return(false)
        post :create, {:sensor_datum => { "ppm" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sensor_datum" do
        sensor_datum = SensorDatum.create! valid_attributes
        # Assuming there are no other sensor_data in the database, this
        # specifies that the SensorDatum created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SensorDatum.any_instance.should_receive(:update).with({ "ppm" => "1" })
        put :update, {:id => sensor_datum.to_param, :sensor_datum => { "ppm" => "1" }}, valid_session
      end

      it "assigns the requested sensor_datum as @sensor_datum" do
        sensor_datum = SensorDatum.create! valid_attributes
        put :update, {:id => sensor_datum.to_param, :sensor_datum => valid_attributes}, valid_session
        assigns(:sensor_datum).should eq(sensor_datum)
      end

      it "redirects to the sensor_datum" do
        sensor_datum = SensorDatum.create! valid_attributes
        put :update, {:id => sensor_datum.to_param, :sensor_datum => valid_attributes}, valid_session
        response.should redirect_to(sensor_datum)
      end
    end

    describe "with invalid params" do
      it "assigns the sensor_datum as @sensor_datum" do
        sensor_datum = SensorDatum.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SensorDatum.any_instance.stub(:save).and_return(false)
        put :update, {:id => sensor_datum.to_param, :sensor_datum => { "ppm" => "invalid value" }}, valid_session
        assigns(:sensor_datum).should eq(sensor_datum)
      end

      it "re-renders the 'edit' template" do
        sensor_datum = SensorDatum.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SensorDatum.any_instance.stub(:save).and_return(false)
        put :update, {:id => sensor_datum.to_param, :sensor_datum => { :ppm => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sensor_datum" do
      sensor_datum = SensorDatum.create! valid_attributes
      expect {
        delete :destroy, {:id => sensor_datum.to_param}, valid_session
      }.to change(SensorDatum, :count).by(-1)
    end

    it "redirects to the sensor_data list" do
      sensor_datum = SensorDatum.create! valid_attributes
      delete :destroy, {:id => sensor_datum.to_param}, valid_session
      response.should redirect_to(sensor_data_url)
    end
  end

end
