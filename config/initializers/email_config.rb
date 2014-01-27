# -*- encoding : utf-8 -*-
ActionMailer::Base.smtp_settings = {
  :address => "example.com",
  :port => '1',
  :domain => "standout.se",
  :authentication => :plain,
  :user_name => "example@example",
  :password => "password"
}
