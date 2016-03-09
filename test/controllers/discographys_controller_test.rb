require 'test_helper'

class DiscographysControllerTest < ActionController::TestCase
  setup do
    @discography = discographys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discographys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discography" do
    assert_difference('Discography.count') do
      post :create, discography: { artist_data_id: @discography.artist_data_id, data: @discography.data, nome: @discography.nome }
    end

    assert_redirected_to discography_path(assigns(:discography))
  end

  test "should show discography" do
    get :show, id: @discography
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discography
    assert_response :success
  end

  test "should update discography" do
    patch :update, id: @discography, discography: { artist_data_id: @discography.artist_data_id, data: @discography.data, nome: @discography.nome }
    assert_redirected_to discography_path(assigns(:discography))
  end

  test "should destroy discography" do
    assert_difference('Discography.count', -1) do
      delete :destroy, id: @discography
    end

    assert_redirected_to discographys_path
  end
end
