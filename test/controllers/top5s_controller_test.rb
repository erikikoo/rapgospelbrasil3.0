require 'test_helper'

class Top5sControllerTest < ActionController::TestCase
  setup do
    @top5 = top5s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top5s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top5" do
    assert_difference('Top5.count') do
      post :create, top5: { artist_id: @top5.artist_id, rank: @top5.rank, titulo: @top5.titulo }
    end

    assert_redirected_to top5_path(assigns(:top5))
  end

  test "should show top5" do
    get :show, id: @top5
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top5
    assert_response :success
  end

  test "should update top5" do
    patch :update, id: @top5, top5: { artist_id: @top5.artist_id, rank: @top5.rank, titulo: @top5.titulo }
    assert_redirected_to top5_path(assigns(:top5))
  end

  test "should destroy top5" do
    assert_difference('Top5.count', -1) do
      delete :destroy, id: @top5
    end

    assert_redirected_to top5s_path
  end
end
