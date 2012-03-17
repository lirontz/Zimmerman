class FixSchema1 < ActiveRecord::Migration
  def up
  	drop_table :room_properties
  end

  def down
  end
end
