require 'spec_helper'

describe "sensors/new" do
  before(:each) do
    assign(:sensor, stub_model(Sensor,
      :device_id => "MyString"
    ).as_new_record)
  end

  it "renders new sensor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sensors_path, "post" do
      assert_select "input#sensor_device_id[name=?]", "sensor[device_id]"
    end
  end
end
