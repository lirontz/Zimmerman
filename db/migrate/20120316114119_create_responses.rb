class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :request_id
      t.integer :site_id

      t.timestamps
    end
  end
end
