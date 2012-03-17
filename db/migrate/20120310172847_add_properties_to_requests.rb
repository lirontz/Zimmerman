class AddPropertiesToRequests < ActiveRecord::Migration
  def self.up
  	add_column(:requests, :room_type_id, :integer, :null => false, :default => 0)
  	add_column(:requests, :region_id, :integer, :null => false, :default => 0)
  	add_column(:requests, :city_id, :integer)
  end

  def self.down
  end
end
