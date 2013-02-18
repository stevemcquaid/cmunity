require 'test_helper'

class UrlPostsControllerTest < ActionController::TestCase
  setup do
    @url_post = url_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_post" do
    assert_difference('UrlPost.count') do
      post :create, url_post: @url_post.attributes
    end

    assert_redirected_to url_post_path(assigns(:url_post))
  end

  test "should show url_post" do
    get :show, id: @url_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @url_post
    assert_response :success
  end

  test "should update url_post" do
    put :update, id: @url_post, url_post: @url_post.attributes
    assert_redirected_to url_post_path(assigns(:url_post))
  end

  test "should destroy url_post" do
    assert_difference('UrlPost.count', -1) do
      delete :destroy, id: @url_post
    end

    assert_redirected_to url_posts_path
  end
end
