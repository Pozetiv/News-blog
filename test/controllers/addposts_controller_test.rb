require 'test_helper'

class AddpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addpost = addposts(:one)
  end

  test "should get index" do
    get addposts_url
    assert_response :success
  end

  test "should get new" do
    get new_addpost_url
    assert_response :success
  end

  test "should create addpost" do
    assert_difference('Addpost.count') do
      post addposts_url, params: { addpost: { body: @addpost.body, text: @addpost.text, title: @addpost.title } }
    end

    assert_redirected_to addpost_url(Addpost.last)
  end

  test "should show addpost" do
    get addpost_url(@addpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_addpost_url(@addpost)
    assert_response :success
  end

  test "should update addpost" do
    patch addpost_url(@addpost), params: { addpost: { body: @addpost.body, text: @addpost.text, title: @addpost.title } }
    assert_redirected_to addpost_url(@addpost)
  end

  test "should destroy addpost" do
    assert_difference('Addpost.count', -1) do
      delete addpost_url(@addpost)
    end

    assert_redirected_to addposts_url
  end
end
