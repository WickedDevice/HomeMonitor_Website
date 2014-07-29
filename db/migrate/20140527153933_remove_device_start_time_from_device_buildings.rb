class RemoveDeviceStartTimeFromDeviceBuildings < ActiveRecord::Migration
  def change
    remove_column :device_buildings, :device_start_time, :integer
  end
end
