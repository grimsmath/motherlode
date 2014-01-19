require 'test_helper'

class NuggetsControllerTest < ActionController::TestCase
  setup do
    @nugget = nuggets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nuggets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nugget" do
    assert_difference('Nugget.count') do
      post :create, nugget: { body: @nugget.body, title: @nugget.title }
    end

    assert_redirected_to nugget_path(assigns(:nugget))
  end

  test "should show nugget" do
    get :show, id: @nugget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nugget
    assert_response :success
  end

  test "should update nugget" do
    patch :update, id: @nugget, nugget: { body: @nugget.body, title: @nugget.title }
    assert_redirected_to nugget_path(assigns(:nugget))
  end

  test "should destroy nugget" do
    assert_difference('Nugget.count', -1) do
      delete :destroy, id: @nugget
    end

    assert_redirected_to nuggets_path
  end
end
