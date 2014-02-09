require 'test_helper'

class MatchTest < ActiveSupport::TestCase

  test 'should send out mails' do
    expected_emails = User.where(present: true).count
    assert_difference 'emails.count', expected_emails do
      Match.notify_friends
    end
  end

end
