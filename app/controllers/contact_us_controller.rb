class ContactUsController < ApplicationController

  def index
  end

  def dispatch_email
    user_info = params[:user_info]
    if ContactUs.contact_us(user_info).deliver
      flash[:notice] = "Sent!"
    else
      flash[:notice] = "Could't send you message."
    end
    redirect_to root_url
  end
end
