require 'test_helper'

class RedeSociaisControllerTest < ActionController::TestCase
  setup do
    @rede_social = rede_sociais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rede_sociais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rede_social" do
    assert_difference('RedeSocial.count') do
      post :create, rede_social: { artist_data_id: @rede_social.artist_data_id, facebook: @rede_social.facebook, googleplus: @rede_social.googleplus, instagram: @rede_social.instagram, linkedid: @rede_social.linkedid, twitter: @rede_social.twitter }
    end

    assert_redirected_to rede_social_path(assigns(:rede_social))
  end

  test "should show rede_social" do
    get :show, id: @rede_social
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rede_social
    assert_response :success
  end

  test "should update rede_social" do
    patch :update, id: @rede_social, rede_social: { artist_data_id: @rede_social.artist_data_id, facebook: @rede_social.facebook, googleplus: @rede_social.googleplus, instagram: @rede_social.instagram, linkedid: @rede_social.linkedid, twitter: @rede_social.twitter }
    assert_redirected_to rede_social_path(assigns(:rede_social))
  end

  test "should destroy rede_social" do
    assert_difference('RedeSocial.count', -1) do
      delete :destroy, id: @rede_social
    end

    assert_redirected_to rede_sociais_path
  end
end
