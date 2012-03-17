class AddUserIdToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :user_id, :integer, :null => false, :default => 0
  end
end
