require 'test_helper'

class MatchTest < ActiveSupport::TestCase

  test 'should send out mails' do
    emails = ActionMailer::Base.deliveries
    assert_difference 'emails.count', 2
      Match.deliver
    end
  end

end
