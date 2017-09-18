require 'test_helper'

class UsersSingupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "TEST FORM" do
    get singup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {name: "",
                                email: "Test@tester.com",
                                password: "123",
                                password_confirmation: "231"} }
    end
    follow_redirect!
    assert_template 'users/new'
  end
end
