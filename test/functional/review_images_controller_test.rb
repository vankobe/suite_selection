require 'test_helper'

class ReviewImagesControllerTest < ActionController::TestCase
  setup do
    @review_image = review_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_image" do
    assert_difference('ReviewImage.count') do
      post :create, review_image: { commment: @review_image.commment, id: @review_image.id, image_path: @review_image.image_path, review_id: @review_image.review_id, shop_id: @review_image.shop_id, user_id: @review_image.user_id }
    end

    assert_redirected_to review_image_path(assigns(:review_image))
  end

  test "should show review_image" do
    get :show, id: @review_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review_image
    assert_response :success
  end

  test "should update review_image" do
    put :update, id: @review_image, review_image: { commment: @review_image.commment, id: @review_image.id, image_path: @review_image.image_path, review_id: @review_image.review_id, shop_id: @review_image.shop_id, user_id: @review_image.user_id }
    assert_redirected_to review_image_path(assigns(:review_image))
  end

  test "should destroy review_image" do
    assert_difference('ReviewImage.count', -1) do
      delete :destroy, id: @review_image
    end

    assert_redirected_to review_images_path
  end
end
