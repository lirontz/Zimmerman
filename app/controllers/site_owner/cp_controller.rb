class SiteOwner::CpController < ApplicationController
	before_filter :authenticate_site_owner!
	
	def index
		
	end

	def main
		@requests = Request.all
		render :layout => 'siteOwnerTabContent'
	end

	def site_editor
	end

	def requests
	end
end
