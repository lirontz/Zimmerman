# -*- coding: utf-8 -*-
class SiteOwnerMailer < ActionMailer::Base
  default :from => "customerservices@gzimmer.com"

  def response_confirmation response, request
  	@request = request
  	@user = User.find(@request.user_id)
  	@site = Site.find(response.site_id)
  	mail(:to => @user.email, :subject => "גברת צימר - צימר מתאים נמצא!.")
  end
end
