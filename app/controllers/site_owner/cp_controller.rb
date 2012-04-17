class SiteOwner::CpController < ApplicationController
	before_filter :authenticate_site_owner!
	
	def index
		
	end

	def main
		@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 
		@requests = []

		if (@site.length > 0)
			@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC").limit(3)
		else
			
		end
		render :layout => 'siteOwnerTabContent'
	end

	def requests
		@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 
		@requests = []

		if (@site.length > 0)
			@requests = Request.joins(:responses).where(:responses => {:site_id => @site.id}).order("created_at DESC")
		else
			
		end
		render :layout => 'siteOwnerTabContent'
	end

	def site_editor
		@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 
		
		if (@site.length > 0)

		else
			@site[0] = Site.new
		end
		render :layout => 'siteOwnerTabContent'		
	end

	def update_site
		render :site_editor, :layout => 'siteOwnerTabContent'
	end
end
