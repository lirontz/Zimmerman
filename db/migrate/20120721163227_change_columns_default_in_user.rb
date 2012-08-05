class ChangeColumnsDefaultInUser < ActiveRecord::Migration
  def up
  	change_column_default(:users, :sms_enabled, true)
  end

  def down
  	change_column_default(:users, :sms_enabled, false)
  end
end
