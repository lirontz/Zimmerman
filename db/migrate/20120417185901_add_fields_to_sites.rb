class AddFieldsToSites < ActiveRecord::Migration
  def up
  	add_column :sites, :description, :text, :null => false, :default => ""
  	add_column :sites, :what_included, :text, :null => false, :default => ""
  	add_column :sites, :phone, :string
  	add_column :sites, :mobile, :string
  	add_column :sites, :fax, :string
  	add_column :sites, :email, :string, :null => false, :default => ""
  	add_column :sites, :contact_point_name, :string, :null => false, :default => ""
  	add_column :sites, :address, :string, :null => false, :default => ""
  end

  def down
  	remove_column :sites, :description
  	remove_column :sites, :what_included
  	remove_column :sites, :phone
  	remove_column :sites, :mobile
  	remove_column :sites, :fax
  	remove_column :sites, :email
  	remove_column :sites, :contact_point_name
  	remove_column :sites, :address
  end
end
