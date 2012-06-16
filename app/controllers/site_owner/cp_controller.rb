# -*- coding: utf-8 -*-

class SiteOwner::CpController < ApplicationController
  before_filter :authenticate_site_owner!

  RESPONSE_STATUSES = {
	:PENDING => 0,
	:ACCEPTED => 1,
	:DECLINED => 2
  }

  def index
	@main_focused= "active"
	@main_focused_active = "in"
  	init_flash
	init_index
  end

  def update_request_status_main
	@main_focused= "active"
	@main_focused_active = "in"
	update_status
  end

  def update_request_status_request
	@request_focused= "active"
	@request_focused_active = "in"
	update_status
  end

  def update
	init_common_data
	init_flash
	@update_focused = "active"
	@update_focused_active = "in"
	if (@site.length > 0)
		if params[:room]
			@site[0].rooms << Room.new(params[:room])
		else
			@site[0].update_attributes(params[:site])
		end
		@rooms = @site[0].rooms
		@rooms.each do |room|
			room.room_properties = []
			room.room_site_properties.each do |room_site_prop|
				room_site_property = RoomProperty.find(room_site_prop.room_property_id)
				room_site_property.price = room_site_prop.price
				room.room_properties << room_site_property
			end
			instance_variable_set("@room#{room.id}_room_properties", (RoomProperty.all - room.room_properties))	
		end
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
    	if params[:site] && !params[:site][:assets_attributes]
    		@site[0].site_properties.destroy_all
		end
    end

    if @site[0].save
    	flash[:notice] = 'פרטי האתר עודכנו בהצלחה!'
    else
    	flash[:error] = 'עדכון פרטי האתר נכשל!'
    end

    @site_assets_exist = @site[0].assets.empty?
    5.times { @site[0].assets.build } 

	init_requests
	init_site_room_properties
	return render :index
  end

  def update_room
	init_common_data
	init_flash
	@update_focused= "active"
	@update_focused_active = "in"
	if (!params[:delete_room].nil?)
	    if Room.delete(params[:room][:id])
	    	flash[:notice] = 'החדר נמחק בהצלחה!'
	    else
	    	flash[:error] = 'מחיקת החדר נכשלה!'
	    end			
	else
		room = @site[0].rooms.find(params[:room][:id])
		
	    if room.update_attributes(params[:room])
	    	flash[:notice] = 'פרטי החדר עודכנו בהצלחה!'
	    else
	    	flash[:error] = 'עדכון פרטי החדר נכשל!'
	    end

		room_room_porperty_site = params["room_" + params[:room][:id] + "_room_porperty_site"]
		if room_room_porperty_site && room_room_porperty_site[:list]
			room_room_porperty_list = room_room_porperty_site[:list]
			room.room_site_properties.destroy_all
			room_room_porperty_list.each do |prop_id|
	  			if prop_id != ""
	  				price = room_room_porperty_site["room_" + room.id.to_s + "_price" + prop_id.to_s]
	  				room.room_site_properties << RoomSiteProperty.new(:room_property_id => prop_id.to_i, :room_id => room.id.to_i, :price => price)
	  			end
		    end
	    else
	    	room.room_site_properties.destroy_all
	    end
	end
	
	init_requests
	
	@site_assets_exist = @site[0].assets.empty?
	5.times { @site[0].assets.build }
	@rooms = @site[0].rooms
	@rooms.each do |room|
		room.room_properties = []
		room.room_site_properties.each do |room_site_prop|
			room_site_property = RoomProperty.find(room_site_prop.room_property_id)
			room_site_property.price = room_site_prop.price
			room.room_properties << room_site_property
		end
		instance_variable_set("@room#{room.id}_room_properties", (RoomProperty.all - room.room_properties))	
	end
	init_site_room_properties
	return render :index
  end

  def response_confirmation
  	response_confirm
  end

  private 

  def update_status
	init_flash
	response_confirm
	init_index
  end

  def init_index
	init_common_data
	if (@site.length > 0)
		@rooms = @site[0].rooms
		
		@rooms.each do |room|
			room.room_properties = []
			room.room_site_properties.each do |room_site_prop|
				room_site_property = RoomProperty.find(room_site_prop.room_property_id)
				room_site_property.price = room_site_prop.price
				room.room_properties << room_site_property
			end
			instance_variable_set("@room#{room.id}_room_properties", (RoomProperty.all - room.room_properties))
		end
		@site_assets_exist = @site[0].assets.empty?
		5.times { @site[0].assets.build } 
		init_requests
	else
		@site[0] = Site.new
	end
	init_site_room_properties
	return render :index
  end

  def init_common_data
	@regions = Region.all
	@cities = City.all
	@room_types = RoomType.all
	@site = Site.where(:site_owner_id => current_site_owner.id.to_s).limit(1)#TODO: limit should be removed in phase 2 
	@requests = []
	@pending_requests = []
	@rooms = []
  end

  def init_flash
	flash[:error] = nil
	flash[:notice] = nil
  end

  def init_requests
	@requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id}).order("created_at DESC")
	@pending_requests = Request.joins(:responses).where(:responses => {:site_id => @site[0].id, :status => 0}).order("created_at DESC")
  end

  def init_site_room_properties
	#workaround - start TODO: fix the model so "has_many :room_properties, through => :site_properties" will work
	@site[0].room_properties = []
	@site[0].site_properties.each do |site_prop|
		room_property = RoomProperty.find(site_prop.room_property_id)
		room_property.price = site_prop.price
		@site[0].room_properties << room_property
	end
	#workaround - end
	@site_room_properties = RoomProperty.all - @site[0].room_properties
  end

  def response_confirm
    response = Response.find(params[:id] || params[:data][:id])
    request = Request.find(response.request_id)
	if (!params[:decline_request].nil?)
		response.status = RESPONSE_STATUSES[:DECLINED]
	    if response.save
	    	flash[:notice] = 'הבקשה עודכנה בהצלחה!'
	    else
	    	flash[:error] = 'עדכון הבקשה נכשל!'
	    end
	else
	    response.status = RESPONSE_STATUSES[:ACCEPTED]
	    if response.save
	    	send_mail(RESPONSE_STATUSES[:ACCEPTED], response, request)
	    	flash[:notice] = 'הבקשה עודכנה בהצלחה!'
	    else
    		flash[:error] = 'עדכון הבקשה נכשל!'
	    end
    end
  end

  def send_mail type, response, request
    return
    case type
    when RESPONSE_STATUSES[:ACCEPTED]
      SiteOwnerMailer.response_confirmation(response, request).deliver
    when RESPONSE_STATUSES[:DECLINED]
      SiteOwnerMailer.response_confirmation(response, request).deliver
    else

    end
  end

=begin
	
	@site[0].errors.full_messages.each do |msg|
		return render :text => msg
	end
	
=end
end
