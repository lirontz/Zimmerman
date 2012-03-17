class CreateSitesRoomPropertiesJoin < ActiveRecord::Migration
  def up
  	create_table :room_properties_sites, :id => false do |t|
      t.integer "room_property_id"
      t.integer "site_id"
  	end
  	add_index :room_properties_sites, ["room_property_id", "site_id"]
  end

  def down
  	drop_table :room_properties_sites
  end
end
