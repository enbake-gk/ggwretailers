require 'test_helper'

class RetailersControllerTest < ActionController::TestCase
  setup do
    @retailer = retailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retailer" do
    assert_difference('Retailer.count') do
      post :create, retailer: { contact_person: @retailer.contact_person, email: @retailer.email, password: @retailer.password, password_confirmation: @retailer.password_confirmation, phone_number: @retailer.phone_number, retailer_name: @retailer.retailer_name, website: @retailer.website }
    end

    assert_redirected_to retailer_path(assigns(:retailer))
  end

  test "should show retailer" do
    get :show, id: @retailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @retailer
    assert_response :success
  end

  test "should update retailer" do
    patch :update, id: @retailer, retailer: { contact_person: @retailer.contact_person, email: @retailer.email, password: @retailer.password, password_confirmation: @retailer.password_confirmation, phone_number: @retailer.phone_number, retailer_name: @retailer.retailer_name, website: @retailer.website }
    assert_redirected_to retailer_path(assigns(:retailer))
  end

  test "should destroy retailer" do
    assert_difference('Retailer.count', -1) do
      delete :destroy, id: @retailer
    end

    assert_redirected_to retailers_path
  end
end
