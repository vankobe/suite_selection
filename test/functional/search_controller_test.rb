require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get products" do
    get :products
    assert_response :success
  end

  test "should get shops" do
    get :shops
    assert_response :success
  end

end
