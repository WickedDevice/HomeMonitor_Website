class AddBuildingIdToSensor < ActiveRecord::Migration
  def change
    add_column :sensors, :building_id, :integer
  end
end
