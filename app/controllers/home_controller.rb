class HomeController < ApplicationController
  def index
  	@request = Request.new
  	@regions = Region.all
  	@room_types = RoomType.all
  	@room_porperties = RoomProperty.all
  end

  def create
  	@regions = Region.all
  	@room_types = RoomType.all
  	@room_porperties = RoomProperty.all
  	#print out params:
  	#return render :text => "The object is #{params.inspect}"
  	#return render :text => "The object is #{params[:request]}"
  	
  	#return render :text => "The room type id is #{ params[:room_type][:id] }"
  	

  	@request = Request.new(params[:request])
  	if @request.save
  		#@request.room_porperties_id = @request.id #this line is not needed, tables are based on has_and_belongs_to_many
  		request_room_porperty_list = params[:room_porperty_request][:list]
  		request_room_porperty_list.each do |prop_id|
  			if prop_id != ""
  				@request.room_properties << RoomProperty.find(prop_id.to_i)
  			end
  		end
  		if @request.save
  			#@request = Request.new
  			render :index
  		else
  			render :index
  		end
	else
  		render :index
  		#return render :text => "save failed!!! errors: #{@request.errors.inspect}"
	end
  end
end
