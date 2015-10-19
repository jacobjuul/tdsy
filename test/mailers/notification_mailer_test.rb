require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  def setup
    @user = User.new(first_name: "Jacob", last_name: "Juul", email: "example@gmail.com", country: "Denmark",
     profile_text: "Lorem ipsum.", gender: "M",  telephone: "11111111", sales_manager: "Valentin", 
     sales_manager_email: "email@sales.com", position: "Manager", os: "Mac", communication: "skype",
     company: "google")
  end

  test "exsisting_account" do
    mail = NotificationMailer.exsisting_account(@user)
    assert_equal "A client has entered the contest", mail.subject
    assert_equal @user.sales_manager_email, mail.to[0]
    assert_equal ["jacob.juul@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
