require 'test_helper'

class ProgramLanguagesControllerTest < ActionController::TestCase
  setup do
    @program_language = program_languages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_language" do
    assert_difference('ProgramLanguage.count') do
      post :create, program_language: { description: @program_language.description, name: @program_language.name }
    end

    assert_redirected_to program_language_path(assigns(:program_language))
  end

  test "should show program_language" do
    get :show, id: @program_language
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_language
    assert_response :success
  end

  test "should update program_language" do
    patch :update, id: @program_language, program_language: { description: @program_language.description, name: @program_language.name }
    assert_redirected_to program_language_path(assigns(:program_language))
  end

  test "should destroy program_language" do
    assert_difference('ProgramLanguage.count', -1) do
      delete :destroy, id: @program_language
    end

    assert_redirected_to program_languages_path
  end
end
