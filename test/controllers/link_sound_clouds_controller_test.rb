require 'test_helper'

class LinkSoundCloudsControllerTest < ActionController::TestCase
  setup do
    @link_sound_cloud = link_sound_clouds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_sound_clouds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_sound_cloud" do
    assert_difference('LinkSoundCloud.count') do
      post :create, link_sound_cloud: { artist_data_id: @link_sound_cloud.artist_data_id, link: @link_sound_cloud.link }
    end

    assert_redirected_to link_sound_cloud_path(assigns(:link_sound_cloud))
  end

  test "should show link_sound_cloud" do
    get :show, id: @link_sound_cloud
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @link_sound_cloud
    assert_response :success
  end

  test "should update link_sound_cloud" do
    patch :update, id: @link_sound_cloud, link_sound_cloud: { artist_data_id: @link_sound_cloud.artist_data_id, link: @link_sound_cloud.link }
    assert_redirected_to link_sound_cloud_path(assigns(:link_sound_cloud))
  end

  test "should destroy link_sound_cloud" do
    assert_difference('LinkSoundCloud.count', -1) do
      delete :destroy, id: @link_sound_cloud
    end

    assert_redirected_to link_sound_clouds_path
  end
end
