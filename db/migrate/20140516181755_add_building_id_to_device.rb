class AddBuildingIdToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :building_id, :integer
  end
end
