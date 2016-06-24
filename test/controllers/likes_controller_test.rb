require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  setup do
    @like = likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create like" do
    assert_difference('Like.count') do
      post :create, like: { artist_data_id: @like.artist_data_id, ip: @like.ip, like: @like.like, unlike: @like.unlike }
    end

    assert_redirected_to like_path(assigns(:like))
  end

  test "should show like" do
    get :show, id: @like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @like
    assert_response :success
  end

  test "should update like" do
    patch :update, id: @like, like: { artist_data_id: @like.artist_data_id, ip: @like.ip, like: @like.like, unlike: @like.unlike }
    assert_redirected_to like_path(assigns(:like))
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete :destroy, id: @like
    end

    assert_redirected_to likes_path
  end
end
