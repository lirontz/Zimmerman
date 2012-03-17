class CreateRoomRoomPropertiesJoin < ActiveRecord::Migration
  def up
  	create_table :room_properties_rooms, :id => false do |t|
  		t.integer "room_property_id"
  		t.integer "room_id"
  	end
  	add_index :room_properties_rooms, ["room_property_id", "room_id"]
  end

  def down
  	drop_table :room_properties_rooms
  end
end
