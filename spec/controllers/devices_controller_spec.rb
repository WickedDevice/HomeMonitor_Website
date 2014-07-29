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

RSpec.describe DevicesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Device. As you add validations to Device, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: "Test device", "user_id" => 1, "encryption_key" => "secret"}
  }

  let(:invalid_attributes) {
    {name: "Other attributes are invalid", user_id: "Not_a_num", experiment_id: "Also not a number", encryption_key: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DevicesController. Be sure to keep this updated too.
  let(:valid_session) { create_test_session() }

  describe "GET index" do
    it "assigns all devices as @devices" do
      old_count = Device.count
      Device.create! valid_attributes
      get :index, {}, valid_session
      expect(Device.count).to eq(old_count+1)
      expect(assigns(:devices)).to eq(Device.all.to_a)
    end
  end

  describe "GET show" do
    it "assigns the requested device as @device" do
      device = Device.create! valid_attributes
      get :show, {:id => device.to_param}, valid_session
      expect(assigns(:device)).to eq(device)
    end
  end

  describe "GET new" do
    it "assigns a new device as @device" do
      get :new, {}, valid_session
      expect(assigns(:device)).to be_a_new(Device)
    end
  end

  describe "GET edit" do
    it "assigns the requested device as @device" do
      device = Device.create! valid_attributes
      get :edit, {:id => device.to_param}, valid_session
      expect(assigns(:device)).to eq(device)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Device" do
        expect {
          post :create, {:device => valid_attributes}, valid_session
        }.to change(Device, :count).by(1)
      end

      it "assigns a newly created device as @device" do
        post :create, {:device => valid_attributes}, valid_session
        expect(assigns(:device)).to be_a(Device)
        expect(assigns(:device)).to be_persisted
      end

      it "redirects to the created device" do
        post :create, {:device => valid_attributes}, valid_session
        expect(response).to redirect_to(Device.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved device as @device" do
        post :create, {:device => invalid_attributes}, valid_session
        expect(assigns(:device)).to be_a_new(Device)
      end

      it "re-renders the 'new' template" do
        post :create, {:device => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge(name: "New Test Device")
      }

      it "updates the requested device" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => new_attributes}, valid_session
        device.reload
        expect(device.name).to eq("New Test Device")
      end

      it "assigns the requested device as @device" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => valid_attributes}, valid_session
        expect(assigns(:device)).to eq(device)
      end

      it "redirects to the device" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => valid_attributes}, valid_session
        expect(response).to redirect_to(device)
      end
    end

    describe "with invalid params" do
      it "assigns the device as @device" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => invalid_attributes}, valid_session
        expect(assigns(:device)).to eq(device)
      end

      it "re-renders the 'edit' template" do
        device = Device.create! valid_attributes
        put :update, {:id => device.to_param, :device => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested device" do
      device = Device.create! valid_attributes
      expect {
        delete :destroy, {:id => device.to_param}, valid_session
      }.to change(Device, :count).by(-1)
    end

    it "redirects to the devices list" do
      device = Device.create! valid_attributes
      delete :destroy, {:id => device.to_param}, valid_session
      expect(response).to redirect_to(devices_url)
    end
  end

end
