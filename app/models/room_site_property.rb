class RoomSiteProperty < ActiveRecord::Base
	belongs_to :room
	belongs_to :room_property
end
