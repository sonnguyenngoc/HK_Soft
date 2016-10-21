require 'test_helper'

class VisasControllerTest < ActionController::TestCase
  setup do
    @visa = visas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visa" do
    assert_difference('Visa.count') do
      post :create, visa: { content_1: @visa.content_1, content_2: @visa.content_2, content_3: @visa.content_3, content_4: @visa.content_4, content_5: @visa.content_5, content_6: @visa.content_6, title_1: @visa.title_1, title_2: @visa.title_2, title_3: @visa.title_3, title_4: @visa.title_4, title_5: @visa.title_5, title_6: @visa.title_6 }
    end

    assert_redirected_to visa_path(assigns(:visa))
  end

  test "should show visa" do
    get :show, id: @visa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visa
    assert_response :success
  end

  test "should update visa" do
    patch :update, id: @visa, visa: { content_1: @visa.content_1, content_2: @visa.content_2, content_3: @visa.content_3, content_4: @visa.content_4, content_5: @visa.content_5, content_6: @visa.content_6, title_1: @visa.title_1, title_2: @visa.title_2, title_3: @visa.title_3, title_4: @visa.title_4, title_5: @visa.title_5, title_6: @visa.title_6 }
    assert_redirected_to visa_path(assigns(:visa))
  end

  test "should destroy visa" do
    assert_difference('Visa.count', -1) do
      delete :destroy, id: @visa
    end

    assert_redirected_to visas_path
  end
end
