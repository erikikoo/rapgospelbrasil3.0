require 'test_helper'

class CommitmentsControllerTest < ActionController::TestCase
  setup do
    @commitment = commitments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commitments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commitment" do
    assert_difference('Commitment.count') do
      post :create, commitment: { artist_data_id: @commitment.artist_data_id, data: @commitment.data, endereco: @commitment.endereco, hora: @commitment.hora, local: @commitment.local, numero: @commitment.numero, site: @commitment.site, telefone: @commitment.telefone }
    end

    assert_redirected_to commitment_path(assigns(:commitment))
  end

  test "should show commitment" do
    get :show, id: @commitment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commitment
    assert_response :success
  end

  test "should update commitment" do
    patch :update, id: @commitment, commitment: { artist_data_id: @commitment.artist_data_id, data: @commitment.data, endereco: @commitment.endereco, hora: @commitment.hora, local: @commitment.local, numero: @commitment.numero, site: @commitment.site, telefone: @commitment.telefone }
    assert_redirected_to commitment_path(assigns(:commitment))
  end

  test "should destroy commitment" do
    assert_difference('Commitment.count', -1) do
      delete :destroy, id: @commitment
    end

    assert_redirected_to commitments_path
  end
end
