class CreateDeviceBuildings < ActiveRecord::Migration
  def change
    create_table :device_buildings do |t|
      t.integer :device_id
      t.integer :building_id
      t.string :location

      t.timestamps
    end
  end
end
