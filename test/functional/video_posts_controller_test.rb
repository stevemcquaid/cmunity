require 'test_helper'

class VideoPostsControllerTest < ActionController::TestCase
  setup do
    @video_post = video_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_post" do
    assert_difference('VideoPost.count') do
      post :create, video_post: @video_post.attributes
    end

    assert_redirected_to video_post_path(assigns(:video_post))
  end

  test "should show video_post" do
    get :show, id: @video_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_post
    assert_response :success
  end

  test "should update video_post" do
    put :update, id: @video_post, video_post: @video_post.attributes
    assert_redirected_to video_post_path(assigns(:video_post))
  end

  test "should destroy video_post" do
    assert_difference('VideoPost.count', -1) do
      delete :destroy, id: @video_post
    end

    assert_redirected_to video_posts_path
  end
end
