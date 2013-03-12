require 'test_helper'

class CountryJpsControllerTest < ActionController::TestCase
  setup do
    @country_jp = country_jps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:country_jps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country_jp" do
    assert_difference('CountryJp.count') do
      post :create, country_jp: { name: @country_jp.name }
    end

    assert_redirected_to country_jp_path(assigns(:country_jp))
  end

  test "should show country_jp" do
    get :show, id: @country_jp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country_jp
    assert_response :success
  end

  test "should update country_jp" do
    put :update, id: @country_jp, country_jp: { name: @country_jp.name }
    assert_redirected_to country_jp_path(assigns(:country_jp))
  end

  test "should destroy country_jp" do
    assert_difference('CountryJp.count', -1) do
      delete :destroy, id: @country_jp
    end

    assert_redirected_to country_jps_path
  end
end
