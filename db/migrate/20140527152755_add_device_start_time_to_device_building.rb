class AddDeviceStartTimeToDeviceBuilding < ActiveRecord::Migration
  def change
    add_column :device_buildings, :device_start_time, :integer
  end
end
