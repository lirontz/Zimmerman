class RoomProperty < ActiveRecord::Base
	attr_accessor :price

	has_and_belongs_to_many :requests
	#has_and_belongs_to_many :site
	has_many :site_properties
	#has_and_belongs_to_many :room
	has_many :room_site_properties
end
