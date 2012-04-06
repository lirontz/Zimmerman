class UserMailer < ActionMailer::Base
  default :from => "customerservices@missz.com"

  def registration_confirmation(user)
  	@user = user
  	mail(:to => user.email, :subject => "Miss Zimmer - Registration confirmation.")
  end

  def request_confirmation(user, request)
  	@user = user
  	@request = request
  	mail(:to => user.email, :subject => "Miss Zimmer - Request confirmation.")
  end

  def failure(user)
  	@user = user
  	mail(:to => user.email, :subject => "Miss Zimmer - Error.")
  end
end
