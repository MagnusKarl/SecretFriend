class UserMailer < ActionMailer::Base
  default from: "notifications@standout.se"

  def secret_friend_email(user, secret_friend)
    @user = user
    @secret_friend = secret_friend
    mail to: @user.email, subject: 'Secret Friend'
  end
end
