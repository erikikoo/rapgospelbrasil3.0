require 'test_helper'

class HistorysControllerTest < ActionController::TestCase
  setup do
    @history = historys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create history" do
    assert_difference('History.count') do
      post :create, history: { artist_data_id: @history.artist_data_id, historia: @history.historia }
    end

    assert_redirected_to history_path(assigns(:history))
  end

  test "should show history" do
    get :show, id: @history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @history
    assert_response :success
  end

  test "should update history" do
    patch :update, id: @history, history: { artist_data_id: @history.artist_data_id, historia: @history.historia }
    assert_redirected_to history_path(assigns(:history))
  end

  test "should destroy history" do
    assert_difference('History.count', -1) do
      delete :destroy, id: @history
    end

    assert_redirected_to historys_path
  end
end
