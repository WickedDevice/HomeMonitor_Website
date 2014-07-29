class AddDeviceAndBuildingIdToSensorDatum < ActiveRecord::Migration
  def change
    add_column :sensor_data, :device_id, :integer
    add_column :sensor_data, :building_id, :integer
  end
end
