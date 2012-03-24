class AddFieldsToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :phone, :string
  	add_column :users, :birthday, :date
  	add_column :users, :partner_birthday, :date
  	add_column :users, :terms_of_use_confirmed, :boolean
  	add_column :users, :gender, :string
  end

  def down
  	remove_column :users, :phone
  	remove_column :users, :birthday
  	remove_column :users, :partner_birthday
  	remove_column :users, :terms_of_use_confirmed
  	remove_column :users, :gender
  end
end
