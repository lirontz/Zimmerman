class Site < ActiveRecord::Base
	belongs_to :site_owners
	belongs_to :region
	belongs_to :city
	belongs_to :room_type
	has_and_belongs_to_many :room_properties
	has_many :responses
end
