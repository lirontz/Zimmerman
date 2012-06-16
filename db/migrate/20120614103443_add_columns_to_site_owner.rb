class AddColumnsToSiteOwner < ActiveRecord::Migration
  def up
  	add_column :site_owners, :phone, :string
  	add_column :site_owners, :birthday, :date
  	add_column :site_owners, :sms_enabled, :boolean
  	add_column :site_owners, :terms_of_use_confirmed, :boolean
  	add_column :site_owners, :gender, :string
  end

  def down
  	remove_column :site_owners, :phone
  	remove_column :site_owners, :birthday
  	remove_column :site_owners, :sms_enabled
  	remove_column :site_owners, :terms_of_use_confirmed
  	remove_column :site_owners, :gender
  end
end
