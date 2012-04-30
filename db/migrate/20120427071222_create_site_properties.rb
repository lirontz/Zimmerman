class CreateSiteProperties < ActiveRecord::Migration
  def up
    create_table :site_properties do |t|
      t.references :site
      t.references :room_property
      t.integer "price"
      t.timestamps
    end
    add_index :site_properties, ['site_id', 'room_property_id']
  end

  def down
  	drop_table :site_properties
  end
end
