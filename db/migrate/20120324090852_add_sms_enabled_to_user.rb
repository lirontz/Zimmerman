class AddSmsEnabledToUser < ActiveRecord::Migration
  def up
  	add_column :users, :sms_enabled, :boolean, :null => false, :default => false
  end

  def down
  	remove_column :users, :sms_enabled
  end
end
