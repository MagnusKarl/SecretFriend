class Match < ActiveRecord::Base

  def self.deliver
    users = User.where(present: true)
    friend_pool = users.dup.to_a

    users.each do |user|
      secret_friend = friend_pool.sample
      friend_pool.delete(secret_friend)
      self.send_info(user, secret_friend.name)
    end

  end

  def self.send_info(user, secret_friend)
    UserMailer.secret_friend_email(user, secret_friend).deliver
  end
end
