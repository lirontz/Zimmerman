class AddColumnToSites < ActiveRecord::Migration
  def up
  	add_column :sites, :room_type_id, :integer, :null => false, :default => 0
  end

  def down
  	remove_column :sites, :room_type_id
  end
end
