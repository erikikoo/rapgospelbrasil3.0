require 'test_helper'

class EddressShowsControllerTest < ActionController::TestCase
  setup do
    @eddress_show = eddress_shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eddress_shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eddress_show" do
    assert_difference('EddressShow.count') do
      post :create, eddress_show: { commitment_id: @eddress_show.commitment_id, endereco: @eddress_show.endereco, local: @eddress_show.local, numero: @eddress_show.numero, site: @eddress_show.site, telefone: @eddress_show.telefone }
    end

    assert_redirected_to eddress_show_path(assigns(:eddress_show))
  end

  test "should show eddress_show" do
    get :show, id: @eddress_show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eddress_show
    assert_response :success
  end

  test "should update eddress_show" do
    patch :update, id: @eddress_show, eddress_show: { commitment_id: @eddress_show.commitment_id, endereco: @eddress_show.endereco, local: @eddress_show.local, numero: @eddress_show.numero, site: @eddress_show.site, telefone: @eddress_show.telefone }
    assert_redirected_to eddress_show_path(assigns(:eddress_show))
  end

  test "should destroy eddress_show" do
    assert_difference('EddressShow.count', -1) do
      delete :destroy, id: @eddress_show
    end

    assert_redirected_to eddress_shows_path
  end
end
