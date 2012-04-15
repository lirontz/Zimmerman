class SiteOwner::CpController < ApplicationController
	before_filter :authenticate_site_owner!
	
	def index
		
	end

	def main
		@site = Site.find(current_site_owner.id)
		@requests = Request.joins(:responses).where(:responses => {:site_id => @site.id}).order("created_at DESC").limit(3)
		#return render :text => @requests.size
		render :layout => 'siteOwnerTabContent'
	end

	def site_editor
		@site = Site.find(current_site_owner.id)
		@requests = Request.joins(:responses).where(:responses => {:site_id => @site.id}).order("created_at DESC")
		render :layout => 'siteOwnerTabContent'
	end

	def requests
		@site = Site.find(current_site_owner.id)
		@requests = Request.joins(:responses).where(:responses => {:site_id => @site.id}).order("created_at DESC")
		render :layout => 'siteOwnerTabContent'
	end
end
