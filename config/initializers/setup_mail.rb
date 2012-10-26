ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "gmail.com",  
  :user_name            => "gevertzimmer@gmail.com",  
  :password             => "4r5t6y7u&",  
  :authentication       => :login,  
  :enable_starttls_auto => true  
}

#ActionMailer::Base.smtp_settings = {
#  :enable_starttls_auto => true,
#  :address => 'smtp.mail.yahoo.com',
#  :port => 587,
#  :domain => 'yahoo.com',
#  :authentication => :plain,
#  :user_name => 'lirontz@yahoo.com',
#  :password => 'tzarfati'
#}

#ActionMailer::Base.smtp_settings = {
#  :enable_starttls_auto => true,
#  :address => 'smtpout.europe.secureserver.net',
#  :port => 25,
#  :domain => 'softbsoft.com',
#  :authentication => :plain,
#  :user_name => 'liron@softbsoft.com',
# :password => 'liron099'
#}

#ActionMailer::Base.smtp_settings = {  
#  :address              => "smtp.gmail.com",  
#  :port                 => 587,  
#  :domain               => "gmail.com",  
#  :user_name            => "ravidtz",  
#  :password             => "liron099",  
#  :authentication       => "plain",  
#  :enable_starttls_auto => true  
#}


#ActionMailer::Base.smtp_settings = {  
#  :address              => "smtpout.europe.secureserver.net",  
#  :port                 => 25,  
# :domain               => "softbsoft.com",  
#  :user_name            => "liron@softbsoft.com",  
#  :password             => "liron099",  
#  :authentication       => :login,  
#  :enable_starttls_auto => true  
#}
