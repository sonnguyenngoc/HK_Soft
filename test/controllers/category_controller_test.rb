require 'test_helper'

class CategoryControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get product_detail" do
    get :product_detail
    assert_response :success
  end

end
