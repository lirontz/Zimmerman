class HomeController < ApplicationController
  def index
  	@request = Request.new
  	@regions = Region.all
  	@room_types = RoomType.all
  	@room_porperties = RoomProperty.all
  end

  def create
    #print out params:
    #return render :text => "The object is #{params.inspect}"
    #return render :text => "The object is #{params[:request]}"
    #return render :text => "RAILS_ENV is #{Rails.env.development?}"
    #return render :text => "The room type id is #{ params[:room_type][:id] }"

    params[:request][:start_date] = DateTime.strptime(params[:request][:start_date], "%d/%m/%Y").to_time()
    params[:request][:end_date] = DateTime.strptime(params[:request][:end_date], "%d/%m/%Y").to_time()
    
    @regions = Region.all
  	@room_types = RoomType.all
  	@room_porperties = RoomProperty.all
    @request = Request.new(params[:request])

    #workaround for datepicker
    #begin
    #  params[:request][:start_date] = params[:request][:start_date].to_datetime()
    #rescue
    #  params[:request][:start_date] = DateTime.now
    #end

    #begin
    #  params[:request][:end_date] = params[:request][:end_date].to_datetime()
    #rescue
    #  params[:request][:end_date] = DateTime.now
    #end
    #return render :text => (params[:request][:start_date].to_s + " " + params[:request][:end_date].to_s)


    if !user_signed_in?
      @user = User.find(:all, :conditions => {:email => params[:user][:email]}).first

      if !@user
        password_length = 6
        password = Devise.friendly_token.first(password_length)
        params[:user][:password] = password
        params[:user][:password_confirmation] = password
        
        @user = User.new(params[:user])
        if @user.save
          #TODO: add error handling
        end
      else 
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.phone = params[:user][:phone]
        @user.save
      end
      @request.user = @user
    end

  	if @request.save
      #@request.room_porperties_id = @request.id #this line is not needed, tables are based on has_and_belongs_to_many
  		request_room_porperty_list = params[:room_porperty_request][:list]
  		request_room_porperty_list.each do |prop_id|
  			if prop_id != ""
  				@request.room_properties << RoomProperty.find(prop_id.to_i)
  			end
  	  end

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
end
