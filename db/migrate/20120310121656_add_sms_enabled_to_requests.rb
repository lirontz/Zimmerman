class AddSmsEnabledToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :sms_enabled, :boolean, :null => false, :default => false
  end
end
