class Request < ActiveRecord::Base
	belongs_to :user, :class_name => "User", :foreign_key => "user_id"
	belongs_to :room_type
	belongs_to :region
	belongs_to :city
	has_and_belongs_to_many :room_properties
	has_many :responses

	validates_presence_of :user
	validates_presence_of :room_type
	validates_presence_of :region
	validates_presence_of :how_many_rooms
	validates_numericality_of :how_many_rooms, :greater_than => 0, :less_than_or_equal_to => 100
	#validate :is_start_date_is_valid_datetime
	#validate :is_end_date_is_valid_datetime
	validates_numericality_of :price_from, :greater_than => 0
	#validates_format_of :price_from, :with => /^\d+??(?:\.\d{0,2})?$/
	validates_numericality_of :price_to, :greater_than => 0
	#validates_format_of :price_to, :with => /^\d+??(?:\.\d{0,2})?$/

  #TODO:create one function
  def is_start_date_is_valid_datetime
    errors.add(:start_date, 'start date must be a valid datetime') if ((DateTime.parse(:start_date) rescue ArgumentError) == ArgumentError)
  end

  def is_end_date_is_valid_datetime
    errors.add(:end_date, 'end date must be a valid datetime') if ((DateTime.parse(:end_date) rescue ArgumentError) == ArgumentError)
  end
end
