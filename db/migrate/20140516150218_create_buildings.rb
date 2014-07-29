class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :location
      t.datetime :start
      t.datetime :end
      t.timestamps
    end
  end
end
