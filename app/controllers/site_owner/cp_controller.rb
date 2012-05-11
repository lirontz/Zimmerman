class SiteOwner::CpController < ApplicationController
	before_filter :authenticate_site_owner!
	
	def index
		@regions = Region.all
		@cities = City.all
		@main_focused= "active"
		@main_focused_active = "in"
		@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 
		@requests = []
		@rooms = []
		
		if (@site.length > 0)
			@rooms = @site[0].rooms
			#@room[0].room_site_properties << RoomSiteProperty.new(:room_property_id => 1, :room_id => 1, :price => 50)
			#return render :text => @rooms[0].room_site_properties[0].price
			@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC")
		else
			@site[0] = Site.new
		end
		
		#workaround - start TODO: fix the model so "has_many :room_properties, through => :site_properties" will work
		@site[0].room_properties = []
		@site[0].site_properties.each do |site_prop|
			@site[0].room_properties << RoomProperty.find(site_prop.room_property_id)
		end
		#workaround - end

		@room_properties = RoomProperty.all - @site[0].room_properties
	end
	
	def update
		@regions = Region.all
		@cities = City.all
		@update_focused= "active"
		@update_focused_active = "in"
		@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 		
		@requests = []
		@rooms = []

		if (@site.length > 0)
			@rooms = @site[0].rooms
			@site[0].update_attributes(params[:site])
		else
			@site[0] = Site.create(params[:site])
		end

		if params[:room_porperty_site] && params[:room_porperty_site][:list]
			request_room_porperty_list = params[:room_porperty_site][:list]
			@site[0].site_properties.destroy_all
			request_room_porperty_list.each do |prop_id|
	  			if prop_id != ""
	  				price = params[:room_porperty_site]["price" + prop_id]
	  				@site[0].site_properties << SiteProperty.new(:room_property_id => prop_id.to_i, :site_id => @site[0].id, :price => price)
	  			end
		    end
	    else
	    	@site[0].site_properties.destroy_all
	    end

	    if @site[0].save
	    else
	    end

		@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC")
		
		#workaround - start TODO: fix the model so "has_many :room_properties, through => :site_properties" will work
		@site[0].room_properties = []
		@site[0].site_properties.each do |site_prop|
			room_property = RoomProperty.find(site_prop.room_property_id)
			room_property.price = site_prop.price
			@site[0].room_properties << room_property
		end
		#workaround - end
		@room_properties = RoomProperty.all - @site[0].room_properties
		return render :index
	end

def update_room
	@regions = Region.all
	@cities = City.all
	@update_focused= "active"
	@update_focused_active = "in"
	@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 
	
	if (!params[:delete_room].nil?)
		Room.delete(params[:room][:id])
	else
		room = @site[0].rooms.find(params[:room][:id])
		room.update_attributes(params[:room])	
	end
	@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC")
	@rooms = @site[0].rooms
	@site[0].room_properties = []
	@site[0].site_properties.each do |site_prop|
		@site[0].room_properties << RoomProperty.find(site_prop.room_property_id)
	end
	@room_properties = RoomProperty.all - @site[0].room_properties
	return render :index
end

def create_room
	@regions = Region.all
	@cities = City.all
	@update_focused= "active"
	@update_focused_active = "in"
	@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 
	@site[0].rooms << Room.new(params[:room])
	@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC")
	@rooms = @site[0].rooms
	@site[0].room_properties = []
	@site[0].site_properties.each do |site_prop|
		@site[0].room_properties << RoomProperty.find(site_prop.room_property_id)
	end
	@room_properties = RoomProperty.all - @site[0].room_properties
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
