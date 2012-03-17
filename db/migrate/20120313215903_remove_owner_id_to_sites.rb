class RemoveOwnerIdToSites < ActiveRecord::Migration
  def up
  	remove_column :sites, :owner_site_id
  end

  def down
  end
end
