class Match < ActiveRecord::Base

  def self.notify_friends
    users = User.where(present: true)
    friend_pool = users.dup.to_a

    users.each do |user|
      secret_friend = user.sample_friend(friend_pool)
      friend_pool.delete(secret_friend)
    end

  end

end
