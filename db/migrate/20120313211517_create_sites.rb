class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :city_id
      t.integer :region_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
