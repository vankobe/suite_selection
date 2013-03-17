require 'test_helper'

class ShopReviewsControllerTest < ActionController::TestCase
  setup do
    @shop_review = shop_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_review" do
    assert_difference('ShopReview.count') do
      post :create, shop_review: { comment: @shop_review.comment, language_id: @shop_review.language_id, shop_id: @shop_review.shop_id, subject: @shop_review.subject }
    end

    assert_redirected_to shop_review_path(assigns(:shop_review))
  end

  test "should show shop_review" do
    get :show, id: @shop_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_review
    assert_response :success
  end

  test "should update shop_review" do
    put :update, id: @shop_review, shop_review: { comment: @shop_review.comment, language_id: @shop_review.language_id, shop_id: @shop_review.shop_id, subject: @shop_review.subject }
    assert_redirected_to shop_review_path(assigns(:shop_review))
  end

  test "should destroy shop_review" do
    assert_difference('ShopReview.count', -1) do
      delete :destroy, id: @shop_review
    end

    assert_redirected_to shop_reviews_path
  end
end
