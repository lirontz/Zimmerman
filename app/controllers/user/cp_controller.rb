class User::CpController < ApplicationController
	before_filter :authenticate_user!

	def index
		@main_focused= "active"
		@main_focused_active = "in"
		@requests = Request.where(:user_id => current_user.id)
	end

	def user_details_update
		@user_details_focused= "active"
		@user_details_focused_active = "in"
		@requests = Request.where(:user_id => current_user.id)
		current_user.update_attributes(params[:user])
		render :index
	end
end
