class SiteOwner::CpController < ApplicationController
	before_filter :authenticate_site_owner!
	
	def index
		@main_focused= "active"
		@main_focused_active = "in"
		@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 
		@requests = []

		if (@site.length > 0)
			@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC")
		else
			@site[0] = Site.new
		end
		@room_properties = RoomProperty.all - @site[0].room_properties
	end
	
	def update
		#return render :text => params["room_porperty_site"]["list"]
		@update_focused= "active"
		@update_focused_active = "in"
		@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 		

		if (@site.length > 0)
			
		else
			@site[0] = Site.create(params[:site])
		end
		#return render :text => @site[0].room_properties[0].id
		request_room_porperty_list = params[:room_porperty_site][:list]
		request_room_porperty_list.each do |prop_id|
  			if prop_id != ""
  				if !@site[0].room_properties.find(prop_id.to_i)
  					@site[0].room_properties << RoomProperty.find(prop_id.to_i)
				end
  			end
	    end

	    if @site[0].save
	    else
	    end

		@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC")
		return render :index
	end


=begin
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
			@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC")
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
=end
end
