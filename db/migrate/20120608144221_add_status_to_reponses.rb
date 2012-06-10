class AddStatusToReponses < ActiveRecord::Migration
  def up
  	add_column :responses, :status, :integer, :null => false, :default => 0
  end

  def down
  	remove_column :responses, :status
  end
end
