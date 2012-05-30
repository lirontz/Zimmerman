# -*- coding: utf-8 -*-
class UserMailer < ActionMailer::Base
  default :from => "customerservices@missz.com"

  def registration_confirmation(user)
  	@user = user
  	mail(:to => user.email, :subject => "גברת צימר - אישור הרשמה.")
  end

  def request_confirmation(user, request)
  	@user = user
  	@request = request
  	mail(:to => user.email, :subject => "גברת צימר - אישור בקשה.")
  end

  def failure(user)
  	@user = user
  	mail(:to => user.email, :subject => "גברת צימר - שגיאה בתהליך.")
  end

  def response_pending(request, site)
    @request = request
    @response = request.responses.last
    @site_owner = site.site_owner
    mail(:to => @site_owner.email, :subject => "גברת צימר - בקשה להצעה.")
  end
end
