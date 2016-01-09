require 'test_helper'

class PersControllerTest < ActionController::TestCase
  setup do
    @per = pers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create per" do
    assert_difference('Per.count') do
      post :create, per: { honest: @per.honest, person: @per.person }
    end

    assert_redirected_to per_path(assigns(:per))
  end

  test "should show per" do
    get :show, id: @per
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @per
    assert_response :success
  end

  test "should update per" do
    patch :update, id: @per, per: { honest: @per.honest, person: @per.person }
    assert_redirected_to per_path(assigns(:per))
  end

  test "should destroy per" do
    assert_difference('Per.count', -1) do
      delete :destroy, id: @per
    end

    assert_redirected_to pers_path
  end
end
