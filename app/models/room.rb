class Room < ActiveRecord::Base
	attr_accessor :room_properties

	#has_and_belongs_to_many :room_properties
	has_many :room_site_properties
	has_and_belongs_to_many :responses_rooms
end
