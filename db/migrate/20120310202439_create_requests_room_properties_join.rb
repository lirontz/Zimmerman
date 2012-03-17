class CreateRequestsRoomPropertiesJoin < ActiveRecord::Migration
  def up
    create_table :requests_room_properties, :id => false do |t|
    	t.integer "request_id"
    	t.integer "room_property_id"
    end
    #add_index :requests_room_properties, ["request_id", "room_property_id"] #Liron: maigration error: Index name 'index_requests_room_properties_on_request_id_and_room_property_id' on table 'requests_room_properties' is too long; the limit is 64 characters
  end

  def down
  	drop_table :requests_room_properties
  end
end
