class SiteOwner::CpController < ApplicationController
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
