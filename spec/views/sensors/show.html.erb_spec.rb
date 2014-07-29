require 'spec_helper'

describe "sensors/show" do
  before(:each) do
    @sensor = assign(:sensor, stub_model(Sensor,
      :device_id => "Device"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Device/)
  end
end
