class RoomProperty < ActiveRecord::Base
	has_and_belongs_to_many :requests
	has_and_belongs_to_many :site
	has_and_belongs_to_many :room
end
