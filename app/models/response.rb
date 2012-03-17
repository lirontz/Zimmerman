class Response < ActiveRecord::Base
	belongs_to :request
	belongs_to :site
	has_and_belongs_to_many :rooms, :class_name => "Room"
end
