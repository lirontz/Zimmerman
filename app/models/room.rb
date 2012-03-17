class Room < ActiveRecord::Base
	has_and_belongs_to_many :room_properties
	has_and_belongs_to_many :responses_rooms
end
