class Site < ActiveRecord::Base
	attr_accessor :room_properties

	belongs_to :site_owners
	belongs_to :region
	belongs_to :city
	belongs_to :room_type
	#has_and_belongs_to_many :room_properties
	has_many :site_properties
	has_many :responses
	has_many :rooms
	has_many :assets
	accepts_nested_attributes_for :assets, :allow_destroy => true
end
