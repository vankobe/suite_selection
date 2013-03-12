require 'test_helper'

class ProductLinksControllerTest < ActionController::TestCase
  setup do
    @product_link = product_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_link" do
    assert_difference('ProductLink.count') do
      post :create, product_link: { country_id: @product_link.country_id, url: @product_link.url }
    end

    assert_redirected_to product_link_path(assigns(:product_link))
  end

  test "should show product_link" do
    get :show, id: @product_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_link
    assert_response :success
  end

  test "should update product_link" do
    put :update, id: @product_link, product_link: { country_id: @product_link.country_id, url: @product_link.url }
    assert_redirected_to product_link_path(assigns(:product_link))
  end

  test "should destroy product_link" do
    assert_difference('ProductLink.count', -1) do
      delete :destroy, id: @product_link
    end

    assert_redirected_to product_links_path
  end
end
