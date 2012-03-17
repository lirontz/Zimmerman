class FixSchema < ActiveRecord::Migration
  def up
  	drop_table :requests_room_properties
  end

  def down
  end
end
