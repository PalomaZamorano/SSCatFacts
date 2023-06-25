require_relative '../test_helper'

class UserTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = User.new(username: "sasas", email: "", password: 123455677)
    @user.save
  end

  def test_unique_username
    user = User.new(username: "sasas", email: "", password: 123455677)
    user.save
    assert_includes user.errors[:username], "has already been taken"
  end

  def test_precense_username
    user = User.new(username: nil, email: "", password: 123455677)
    user.save
    assert_includes user.errors[:username], "can't be blank"
  end
end
