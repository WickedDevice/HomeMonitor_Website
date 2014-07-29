class CreateSensorData < ActiveRecord::Migration
  def change
    create_table :sensor_data do |t|
      t.string :title
      t.float :data
      t.timestamps
    end
  end
end