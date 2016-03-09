require 'test_helper'

class ArtistDatasControllerTest < ActionController::TestCase
  setup do
    @artist_data = artist_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artist_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist_data" do
    assert_difference('ArtistData.count') do
      post :create, artist_data: { historia: @artist_data.historia, nome: @artist_data.nome }
    end

    assert_redirected_to artist_data_path(assigns(:artist_data))
  end

  test "should show artist_data" do
    get :show, id: @artist_data
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist_data
    assert_response :success
  end

  test "should update artist_data" do
    patch :update, id: @artist_data, artist_data: { historia: @artist_data.historia, nome: @artist_data.nome }
    assert_redirected_to artist_data_path(assigns(:artist_data))
  end

  test "should destroy artist_data" do
    assert_difference('ArtistData.count', -1) do
      delete :destroy, id: @artist_data
    end

    assert_redirected_to artist_datas_path
  end
end
