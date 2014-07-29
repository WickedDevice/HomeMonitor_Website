class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :device_id
      t.integer :battery_status
    end
  end
end
