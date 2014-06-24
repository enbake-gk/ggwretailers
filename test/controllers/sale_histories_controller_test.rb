require 'test_helper'

class SaleHistoriesControllerTest < ActionController::TestCase
  setup do
    @sale_history = sale_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sale_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale_history" do
    assert_difference('SaleHistory.count') do
      post :create, sale_history: { brand_id: @sale_history.brand_id, customer_id: @sale_history.customer_id, equipment_id: @sale_history.equipment_id, model_id: @sale_history.model_id, selling_date: @sale_history.selling_date, serial_no: @sale_history.serial_no }
    end

    assert_redirected_to sale_history_path(assigns(:sale_history))
  end

  test "should show sale_history" do
    get :show, id: @sale_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale_history
    assert_response :success
  end

  test "should update sale_history" do
    patch :update, id: @sale_history, sale_history: { brand_id: @sale_history.brand_id, customer_id: @sale_history.customer_id, equipment_id: @sale_history.equipment_id, model_id: @sale_history.model_id, selling_date: @sale_history.selling_date, serial_no: @sale_history.serial_no }
    assert_redirected_to sale_history_path(assigns(:sale_history))
  end

  test "should destroy sale_history" do
    assert_difference('SaleHistory.count', -1) do
      delete :destroy, id: @sale_history
    end

    assert_redirected_to sale_histories_path
  end
end
