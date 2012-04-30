class SiteProperty < ActiveRecord::Base
	belongs_to :site
	belongs_to :room_property
end
