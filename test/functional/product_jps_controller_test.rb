require 'test_helper'

class ProductJpsControllerTest < ActionController::TestCase
  setup do
    @product_jp = product_jps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_jps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_jp" do
    assert_difference('ProductJp.count') do
      post :create, product_jp: { long_desc: @product_jp.long_desc, name: @product_jp.name, product_id: @product_jp.product_id, short_desc: @product_jp.short_desc }
    end

    assert_redirected_to product_jp_path(assigns(:product_jp))
  end

  test "should show product_jp" do
    get :show, id: @product_jp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_jp
    assert_response :success
  end

  test "should update product_jp" do
    put :update, id: @product_jp, product_jp: { long_desc: @product_jp.long_desc, name: @product_jp.name, product_id: @product_jp.product_id, short_desc: @product_jp.short_desc }
    assert_redirected_to product_jp_path(assigns(:product_jp))
  end

  test "should destroy product_jp" do
    assert_difference('ProductJp.count', -1) do
      delete :destroy, id: @product_jp
    end

    assert_redirected_to product_jps_path
  end
end
