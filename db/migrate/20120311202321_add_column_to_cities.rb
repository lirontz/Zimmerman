class AddColumnToCities < ActiveRecord::Migration
  def change
  	add_column(:cities, :name, :string, :null => false, :default => '')
  end
end
