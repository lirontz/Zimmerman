class ChangeRequstDefaultsForPriceAndHowManyRooms < ActiveRecord::Migration
  def up
  	change_column_default(:requests, :price_from, nil)
  	change_column_default(:requests, :price_to, nil)
  	change_column_default(:requests, :how_many_rooms, nil)
  end

  def down
  end
end
