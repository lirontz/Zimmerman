# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  require 'timeout'

  MAIL_TYPES = {
    :registration => 0,
    :confirmation => 1,
    :failure => 2
  }

  def index
  	@request = Request.new
  	@regions = Region.all
  	@room_types = RoomType.all
  	@room_porperties = RoomProperty.all
  end

  def create
    params[:request][:start_date] = DateTime.strptime(params[:request][:start_date], "%d/%m/%Y").to_time()
    params[:request][:end_date] = DateTime.strptime(params[:request][:end_date], "%d/%m/%Y").to_time()
    
    @regions = Region.all
  	@room_types = RoomType.all
  	@room_porperties = RoomProperty.all
    @request = Request.new(params[:request])

    if !user_signed_in?
      @user = User.find(:all, :conditions => {:email => params[:user][:email]}).first

      if !@user
        password_length = 6
        password = Devise.friendly_token.first(password_length)
        params[:user][:password] = password
        params[:user][:password_confirmation] = password
        
        @user = User.new(params[:user])
        if @user.save
          #send_mail @user, MAIL_TYPES[:registration]
        else
          #send_mail @user, MAIL_TYPES[:failure]
        end
      else 
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.phone = params[:user][:phone]
        if @user.save
          #send_mail @user, MAIL_TYPES[:confirmation], @request
        else
          #send_mail @user, MAIL_TYPES[:failure]
        end
      end
      @request.user = @user
    end

    @request.status = 1 #1 = pending TODO: add constants for status

  	if @request.save
      #@request.room_porperties_id = @request.id #this line is not needed, tables are based on has_and_belongs_to_many
  		request_room_porperty_list = params[:room_porperty_request][:list]
  		request_room_porperty_list.each do |prop_id|
  			if prop_id != ""
  				@request.room_properties << RoomProperty.find(prop_id.to_i)
  			end
	    end

  		if @request.save
        sites_counter = 0
        matched_sites = Site.where(:region_id => params[:request][:region_id], :room_type_id => params[:request][:room_type_id])
        matched_sites.each do |site|
          if is_array_included(@request.room_properties, site.room_properties)
            sites_counter += 1
            @request.responses << Response.new( :site_id => site.id)
          end
        end

        if sites_counter > 0
          flash[:notice] = nil
          send_mail @user, MAIL_TYPES[:confirmation], @request
          render 'request_confirmation'
        else
          flash[:notice] = "לא נמצאו צימרים העונים לדרישתך! אנא שנה את מאפייני החיפוש שלך ונסה שוב."
          render :index
        end
  		else
  			#TODO: add error which indicates that room properties doesn't saved! --> return render :text => "save failed!!! errors: #{@request.errors.inspect}"
        render :index
  		end
	  else
  		#TODO: add error which indicates that request doesn't saved! --> return render :text => "save failed!!! errors: #{@request.errors.inspect}"
      render :index
	  end
  end

  private

  def is_array_included arr_1, arr_2
    (arr_1 - arr_2).size == 0
  end

  def send_mail user, type, request = nil
    #begin
      #status = Timeout::timeout(4) {
        case type
        when MAIL_TYPES[:registration]
          UserMailer.registration_confirmation(user).deliver
        when MAIL_TYPES[:confirmation]
          UserMailer.request_confirmation(user, request).deliver
        when MAIL_TYPES[:failure]
          UserMailer.failure(user).deliver
        else

        end
      #}
    #rescue

    #end
  end
end
