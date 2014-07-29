require 'spec_helper'

describe "sensors/edit" do
  before(:each) do
    @sensor = assign(:sensor, stub_model(Sensor,
      :device_id => "MyString"
    ))
  end

  it "renders the edit sensor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sensor_path(@sensor), "post" do
      assert_select "input#sensor_device_id[name=?]", "sensor[device_id]"
    end
  end
end
