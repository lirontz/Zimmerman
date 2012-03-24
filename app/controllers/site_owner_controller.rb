class SiteOwnerController < ApplicationController
  def index
  	
  end

  def create
  	return render :text => current_site_owner.inspect
  end

  def welcome
  	
  	return render :text => "The object is #{current_site_owner.email}"
  end
end
