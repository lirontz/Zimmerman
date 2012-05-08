class CreateRoomSiteProperties < ActiveRecord::Migration
  def change
    create_table :room_site_properties do |t|
      t.references :room
      t.references :room_property
      t.integer "price"
      t.timestamps
    end
    add_index :room_site_properties, ['room_id', 'room_property_id']
  end
end
