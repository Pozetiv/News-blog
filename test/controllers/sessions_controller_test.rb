require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'new sessions' do
    get login_path
    assert_response :success
  end
end
