class AddStatusToRequests < ActiveRecord::Migration
  def up
  	add_column :requests, :status, :integer, :null => false, :default => 0
  end

  def down
  	remove_column :requests, :status
  end
end
