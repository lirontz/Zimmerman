class RoomType < ActiveRecord::Base
	validates_presence_of :name

	has_one :request
end
