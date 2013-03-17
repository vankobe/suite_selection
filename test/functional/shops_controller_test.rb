require 'test_helper'

class ShopsControllerTest < ActionController::TestCase
  setup do
    @shop = shops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post :create, shop: { address: @shop.address, country_id: @shop.country_id, home_url: @shop.home_url, latitude: @shop.latitude, longitude: @shop.longitude, name: @shop.name, online_url: @shop.online_url, score: @shop.score, state_id: @shop.state_id }
    end

    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should show shop" do
    get :show, id: @shop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop
    assert_response :success
  end

  test "should update shop" do
    put :update, id: @shop, shop: { address: @shop.address, country_id: @shop.country_id, home_url: @shop.home_url, latitude: @shop.latitude, longitude: @shop.longitude, name: @shop.name, online_url: @shop.online_url, score: @shop.score, state_id: @shop.state_id }
    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete :destroy, id: @shop
    end

    assert_redirected_to shops_path
  end
end
