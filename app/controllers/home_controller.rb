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
      send_mail @user, MAIL_TYPES[:confirmation], @request
      #@request.room_porperties_id = @request.id #this line is not needed, tables are based on has_and_belongs_to_many
  		request_room_porperty_list = params[:room_porperty_request][:list]
  		request_room_porperty_list.each do |prop_id|
  			if prop_id != ""
  				@request.room_properties << RoomProperty.find(prop_id.to_i)
  			end
	    end

      #@request.responses << Response.new
#debugger;
  		if @request.save
  			render ('request_confirmation')
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
