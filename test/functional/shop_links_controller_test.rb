require 'test_helper'

class ShopLinksControllerTest < ActionController::TestCase
  setup do
    @shop_link = shop_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_link" do
    assert_difference('ShopLink.count') do
      post :create, shop_link: { country_id: @shop_link.country_id, url: @shop_link.url }
    end

    assert_redirected_to shop_link_path(assigns(:shop_link))
  end

  test "should show shop_link" do
    get :show, id: @shop_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_link
    assert_response :success
  end

  test "should update shop_link" do
    put :update, id: @shop_link, shop_link: { country_id: @shop_link.country_id, url: @shop_link.url }
    assert_redirected_to shop_link_path(assigns(:shop_link))
  end

  test "should destroy shop_link" do
    assert_difference('ShopLink.count', -1) do
      delete :destroy, id: @shop_link
    end

    assert_redirected_to shop_links_path
  end
end
