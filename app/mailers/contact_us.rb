# -*- coding: utf-8 -*-
class ContactUs < ActionMailer::Base
  headers = {'Return-Path' => 'gevertzimmer@gmail.com'}

  def contact_us(user_info)
    @user_info = user_info

    mail(:from => "פניית לקוח <gevertzimmer@gmail.com>", :to => "gevertzimmer@gmail.com", :subject => "גברת צימר - פניית לקוח!.", return_path: "gevertzimmer@gmail.com", :body => render('contact_us_mailer/contact_us'), content_type: "text/html")
  end
end
