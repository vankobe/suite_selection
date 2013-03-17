require 'test_helper'

class ShopReviewImagesControllerTest < ActionController::TestCase
  setup do
    @shop_review_image = shop_review_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_review_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_review_image" do
    assert_difference('ShopReviewImage.count') do
      post :create, shop_review_image: { comment: @shop_review_image.comment, image_path: @shop_review_image.image_path, review_id: @shop_review_image.review_id, shop_id: @shop_review_image.shop_id }
    end

    assert_redirected_to shop_review_image_path(assigns(:shop_review_image))
  end

  test "should show shop_review_image" do
    get :show, id: @shop_review_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_review_image
    assert_response :success
  end

  test "should update shop_review_image" do
    put :update, id: @shop_review_image, shop_review_image: { comment: @shop_review_image.comment, image_path: @shop_review_image.image_path, review_id: @shop_review_image.review_id, shop_id: @shop_review_image.shop_id }
    assert_redirected_to shop_review_image_path(assigns(:shop_review_image))
  end

  test "should destroy shop_review_image" do
    assert_difference('ShopReviewImage.count', -1) do
      delete :destroy, id: @shop_review_image
    end

    assert_redirected_to shop_review_images_path
  end
end
