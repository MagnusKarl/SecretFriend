require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'should not get himself if there are more than himself left in pool' do
    u = User.first
    100.times do
      assert u.sample_friend(User.all.dup).id != u.id
    end
  end

  test 'if only one person is in the list it is okay to get himself from friends' do
    u = User.first
    User.where.not(id: u.id).delete_all
    30.times do
      assert u.sample_friend(User.all.dup).id == u.id
    end
  end

  test 'should not return the same person all the time' do
    friends = []
    johanna = User.find_by_name 'Johanna'
    30.times do
      friend_list = User.all.dup.to_a
      friends << johanna.sample_friend(friend_list)
    end
    assert_equal 2, friends.uniq.size
  end

end
