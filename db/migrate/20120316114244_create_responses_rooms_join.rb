class CreateResponsesRoomsJoin < ActiveRecord::Migration
  def up
  	create_table :responses_rooms, :id => false do |t|
  		t.integer "response_id"
  		t.integer "room_id"
  	end
  	add_index :responses_rooms, ["response_id", "room_id"]
  end

  def down
  	drop_table :responses_rooms
  end
end
