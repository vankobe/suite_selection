require 'test_helper'

class ShopJpsControllerTest < ActionController::TestCase
  setup do
    @shop_jp = shop_jps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_jps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_jp" do
    assert_difference('ShopJp.count') do
      post :create, shop_jp: { city_id: @shop_jp.city_id, country_id: @shop_jp.country_id, image_path: @shop_jp.image_path, latitude: @shop_jp.latitude, long_desc: @shop_jp.long_desc, longitude: @shop_jp.longitude, name: @shop_jp.name, prefecture_id: @shop_jp.prefecture_id, shop_id: @shop_jp.shop_id, short_desc: @shop_jp.short_desc }
    end

    assert_redirected_to shop_jp_path(assigns(:shop_jp))
  end

  test "should show shop_jp" do
    get :show, id: @shop_jp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_jp
    assert_response :success
  end

  test "should update shop_jp" do
    put :update, id: @shop_jp, shop_jp: { city_id: @shop_jp.city_id, country_id: @shop_jp.country_id, image_path: @shop_jp.image_path, latitude: @shop_jp.latitude, long_desc: @shop_jp.long_desc, longitude: @shop_jp.longitude, name: @shop_jp.name, prefecture_id: @shop_jp.prefecture_id, shop_id: @shop_jp.shop_id, short_desc: @shop_jp.short_desc }
    assert_redirected_to shop_jp_path(assigns(:shop_jp))
  end

  test "should destroy shop_jp" do
    assert_difference('ShopJp.count', -1) do
      delete :destroy, id: @shop_jp
    end

    assert_redirected_to shop_jps_path
  end
end
