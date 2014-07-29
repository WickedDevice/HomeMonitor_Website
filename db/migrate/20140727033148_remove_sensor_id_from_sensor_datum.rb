class RemoveSensorIdFromSensorDatum < ActiveRecord::Migration
  def change
    remove_column :sensor_data, :sensor_id, :string
  end
end
