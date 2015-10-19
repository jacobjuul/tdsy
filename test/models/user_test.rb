require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # First setup the user
  def setup
    @user = User.new(first_name: "Jacob", last_name: "Juul", email: "example@gmail.com", country: "Denmark",
     profile_text: "Lorem ipsum.", gender: "M",  telephone: "11111111", sales_manager: "Valentin", 
     sales_manager_email: "email@sales.com", position: "Manager", os: "Mac", communication: "skype",
     company: "google")
  end

  # test if the @user is a valid instance of the User class
  test "should be a valid user" do
    assert @user.valid?
  end

  test "required field first_name must be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end 

  test "required field last_name must be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end 

  test "required field company must be present" do
    @user.company = ""
    assert_not @user.valid?
  end 

  test "required field position must be present" do
    @user.position = ""
    assert_not @user.valid?
  end 

  test "email validation should accept valid addresses" do
    valid_addresses = %w[jacob@juul.com JACOB@foo.COM jacob_juul@so.good.org
                      first.last@foo.jp jacob+juul@korea.co.kr]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email address should be unique" do
    # create a duplicate user
    user_duplicate = @user.dup

    # the duplicate gets the same email, but uppercase
    # to test that it still validates correctly
    user_duplicate.email = @user.email.upcase

    #save the user
    @user.save

    # is the user valid?
    assert_not user_duplicate.valid?
  end
end
