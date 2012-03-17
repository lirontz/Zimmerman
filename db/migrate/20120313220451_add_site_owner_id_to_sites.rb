class AddSiteOwnerIdToSites < ActiveRecord::Migration
  def change
  	add_column :sites, :site_owner_id, :integer, :null => false, :default => 0
  end
end
