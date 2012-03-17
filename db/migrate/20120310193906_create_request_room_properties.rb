class CreateRequestRoomProperties < ActiveRecord::Migration
  def up
  	create_table :requests_room_properties do |t|
  	  t.integer :room_property_id
      t.integer :request_id

      t.timestamps
  	end
  end

  def down
  end
end
