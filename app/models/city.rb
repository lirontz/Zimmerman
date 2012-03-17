class City < ActiveRecord::Base
	validates_presence_of :name

	has_one :request
	has_one :site
end
