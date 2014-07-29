class AddSensorIdToSensorDatum < ActiveRecord::Migration
  def change
    add_column :sensor_data, :sensor_id, :integer
  end
end
