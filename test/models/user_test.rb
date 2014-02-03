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
    100.times do
      assert u.sample_friend(User.all.dup).id == u.id
    end
  end

end
