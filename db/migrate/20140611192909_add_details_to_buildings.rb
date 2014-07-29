class AddDetailsToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :details, :text
  end
end
