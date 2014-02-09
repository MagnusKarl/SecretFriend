class User < ActiveRecord::Base

  attr_accessor :list_of_friends

  def sample_friend(list_of_friends)
    @list_of_friends = list_of_friends
    email_or_try_again(list_of_friends.sample)
  end

  # Don't allow ourselves as our own secret friend
  def email_or_try_again(friend)
    if friend.id == self.id && list_of_friends.size > 1
      sample_friend(list_of_friends)
    else
      email_me(friend)
    end
  end

  # It is time to tell the user who she got as a secret friend
  def email_me(secret_friend)
    UserMailer.secret_friend_email(self, secret_friend.name).deliver
    return secret_friend
  end

end
