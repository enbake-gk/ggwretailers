require 'test_helper'

class RetailerGroupsControllerTest < ActionController::TestCase
  setup do
    @retailer_group = retailer_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retailer_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retailer_group" do
    assert_difference('RetailerGroup.count') do
      post :create, retailer_group: { name: @retailer_group.name }
    end

    assert_redirected_to retailer_group_path(assigns(:retailer_group))
  end

  test "should show retailer_group" do
    get :show, id: @retailer_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @retailer_group
    assert_response :success
  end

  test "should update retailer_group" do
    patch :update, id: @retailer_group, retailer_group: { name: @retailer_group.name }
    assert_redirected_to retailer_group_path(assigns(:retailer_group))
  end

  test "should destroy retailer_group" do
    assert_difference('RetailerGroup.count', -1) do
      delete :destroy, id: @retailer_group
    end

    assert_redirected_to retailer_groups_path
  end
end
