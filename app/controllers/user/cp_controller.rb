# -*- coding: utf-8 -*-

class User::CpController < ApplicationController
  before_filter :authenticate_user!

  def index
	@main_focused= "active"
	@main_focused_active = "in"
	init_common_data
  end

  def user_details_update
	@user_details_focused= "active"
	@user_details_focused_active = "in"
	init_common_data
	
	if current_user.update_attributes(params[:user])
	  flash[:error] = nil
	  flash[:notice] = 'פרטיך עודכנו בהצלחה!'
	else
	  flash[:notice] = nil
	  flash[:error] = 'העדכון נכשל!'
	end
	render :index
  end

  private

  def init_common_data
	@requests = Request.where(:user_id => current_user.id)
  end
end
