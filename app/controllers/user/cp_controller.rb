# -*- coding: utf-8 -*-
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
		
		#current_user.update_attributes(params[:user])
		
		if current_user.update_with_password(params[:user])
		  sign_in(current_user, :bypass => true)
		  flash[:notice] = 'פרטיך עודכנו בהצלחה!'
		else
		  flash[:notice] = 'העדכון נכשל!'
		end
		render :index
	end
end
