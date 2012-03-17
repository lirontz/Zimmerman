class Request < ActiveRecord::Base
	belongs_to :user, :class_name => "User", :foreign_key => "user_id"
	belongs_to :room_type
	belongs_to :region
	belongs_to :city
	has_and_belongs_to_many :room_properties
	has_many :responses

	validates_presence_of :room_type
	validates_presence_of :region
	#validates_presence_of :user, :on => :create
end
