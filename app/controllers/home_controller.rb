# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  require 'timeout'

  MAIL_TYPES = {
    :registration => 0,
    :confirmation => 1,
    :failure => 2,
    :response_pending => 3
  }

  def index
    flash[:error] = nil
    flash[:notice] = nil
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @request = Request.new
  	@regions = Region.all
  	@room_types = RoomType.all
  	@room_porperties = RoomProperty.all
  end

  def create
    flash[:error] = nil
    flash[:notice] = nil
    params[:request][:start_date] = DateTime.strptime(params[:request][:start_date], "%d/%m/%Y").to_time()
    params[:request][:end_date] = DateTime.strptime(params[:request][:end_date], "%d/%m/%Y").to_time()
    if params[:request][:price_from].empty?
      params[:request][:price_from] = 0
    end
    if params[:request][:price_to].empty?
      params[:request][:price_to] = 0
    end
    
    @regions = Region.all
  	@room_types = RoomType.all
  	@room_porperties = RoomProperty.all
    @request = Request.new(params[:request])

    if !user_signed_in?
      @user = User.find(:all, :conditions => {:email => params[:user][:email]}).first

      if !@user
        #assword_length = 6
        #password = Devise.friendly_token.first(password_length)
        password = generate_activation_code()
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
    else
      @user = User.find(current_user.id)
      @user.update_attributes(params[:user])
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
        @sites_counter = 0
        matched_sites = Site.where(:region_id => params[:request][:region_id], :room_type_id => params[:request][:room_type_id])
        matched_sites.each do |site|
          site.room_properties = []
          site.site_properties.each do |site_prop|
            site.room_properties << RoomProperty.find(site_prop.room_property_id)
          end
          if is_array_included(@request.room_properties, site.room_properties)
            @sites_counter += 1
            @request.responses << Response.new( :site_id => site.id)
            send_mail @user, MAIL_TYPES[:response_pending], @request, site
          end
        end

        if @sites_counter > 0
          send_mail @user, MAIL_TYPES[:confirmation], @request, nil, password
          render 'request_confirmation'
        else
          flash[:error] = "לא נמצאו צימרים העונים לדרישתך! אנא שנה את מאפייני החיפוש שלך ונסה שוב."
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

  def send_mail user, type, request = nil, site = nil, password = nil
    #begin
      #status = Timeout::timeout(4) {
        case type
        when MAIL_TYPES[:registration]
          UserMailer.registration_confirmation(user).deliver
        when MAIL_TYPES[:confirmation]
          UserMailer.request_confirmation(user, request, password).deliver
        when MAIL_TYPES[:failure]
          UserMailer.failure(user).deliver
        when MAIL_TYPES[:response_pending]
          UserMailer.response_pending(request, site).deliver
        else

        end
      #}
    #rescue

    #end
  end

  def generate_activation_code(size = 6)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
end
