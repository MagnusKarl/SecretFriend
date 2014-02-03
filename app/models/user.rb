class User < ActiveRecord::Base

  def sample_friend(list_of_friends)
    return list_of_friends.first if list_of_friends.size == 1
    list_of_friends.delete(self)
    list_of_friends.sample
  end

end
