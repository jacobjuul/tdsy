require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "exsisting_account" do
    mail = NotificationMailer.exsisting_account
    assert_equal "Exsisting account", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
