class AddBaseColumnsToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :how_many_rooms, :integet, :null => false, :default => 0
  	add_column :requests, :start_date, :datetime, :null => false, :default => Time.now
  	add_column :requests, :end_date, :datetime, :null => false, :default => Time.now
  	add_column :requests, :price_from, :integet, :null => false, :default => 0
  	add_column :requests, :price_to, :integet, :null => false, :default => 0
  	add_column :requests, :room_properties_id, :integet, :null => false, :default => 0
  end
end
