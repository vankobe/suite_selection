require 'test_helper'

class ShopHomeLinksControllerTest < ActionController::TestCase
  setup do
    @shop_home_link = shop_home_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_home_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_home_link" do
    assert_difference('ShopHomeLink.count') do
      post :create, shop_home_link: { country_id: @shop_home_link.country_id, url: @shop_home_link.url }
    end

    assert_redirected_to shop_home_link_path(assigns(:shop_home_link))
  end

  test "should show shop_home_link" do
    get :show, id: @shop_home_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_home_link
    assert_response :success
  end

  test "should update shop_home_link" do
    put :update, id: @shop_home_link, shop_home_link: { country_id: @shop_home_link.country_id, url: @shop_home_link.url }
    assert_redirected_to shop_home_link_path(assigns(:shop_home_link))
  end

  test "should destroy shop_home_link" do
    assert_difference('ShopHomeLink.count', -1) do
      delete :destroy, id: @shop_home_link
    end

    assert_redirected_to shop_home_links_path
  end
end
