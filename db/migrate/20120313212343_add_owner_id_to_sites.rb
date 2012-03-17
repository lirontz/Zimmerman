class AddOwnerIdToSites < ActiveRecord::Migration
  def change
  	add_column :sites, :owner_site_id, :integer, :null => false, :default => 0
  end
end
