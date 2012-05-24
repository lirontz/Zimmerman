class SiteOwner::SiteController < ApplicationController
  def index
  	@site = Site.find(params[:id])
  	@site_owner = SiteOwner.find(@site.site_owner_id)
  	render :layout => 'site_owner_site'
  end
end
