class AddSensorTypeMinMaxActivatedToSensor < ActiveRecord::Migration
  def change
    add_column :sensors, :sensor_type, :string
    add_column :sensors, :min_val, :float
    add_column :sensors, :max_val, :float
    add_column :sensors, :activated, :boolean
  end
end