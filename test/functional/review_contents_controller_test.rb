require 'test_helper'

class ReviewContentsControllerTest < ActionController::TestCase
  setup do
    @review_content = review_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_content" do
    assert_difference('ReviewContent.count') do
      post :create, review_content: { comment: @review_content.comment, review_id: @review_content.review_id }
    end

    assert_redirected_to review_content_path(assigns(:review_content))
  end

  test "should show review_content" do
    get :show, id: @review_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review_content
    assert_response :success
  end

  test "should update review_content" do
    put :update, id: @review_content, review_content: { comment: @review_content.comment, review_id: @review_content.review_id }
    assert_redirected_to review_content_path(assigns(:review_content))
  end

  test "should destroy review_content" do
    assert_difference('ReviewContent.count', -1) do
      delete :destroy, id: @review_content
    end

    assert_redirected_to review_contents_path
  end
end
