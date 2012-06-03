class AddPriceToRooms < ActiveRecord::Migration
  def up
  	add_column :rooms, :price, :integer, :null => false, :default => 0
  end

  def down
  	remove_column :rooms, :price
  end
end
