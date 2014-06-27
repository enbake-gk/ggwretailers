require 'test_helper'

class SaleToCustomersControllerTest < ActionController::TestCase
  setup do
    @sale_to_customer = sale_to_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sale_to_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale_to_customer" do
    assert_difference('SaleToCustomer.count') do
      post :create, sale_to_customer: { accessory_id: @sale_to_customer.accessory_id, address: @sale_to_customer.address, brand_id: @sale_to_customer.brand_id, city: @sale_to_customer.city, created_at: @sale_to_customer.created_at, customer_id: @sale_to_customer.customer_id, customer_note: @sale_to_customer.customer_note, dob: @sale_to_customer.dob, email: @sale_to_customer.email, equipment_id: @sale_to_customer.equipment_id, first_name: @sale_to_customer.first_name, last_name: @sale_to_customer.last_name, mobile: @sale_to_customer.mobile, model_id: @sale_to_customer.model_id, name: @sale_to_customer.name, post_code: @sale_to_customer.post_code, price: @sale_to_customer.price, purchase_date: @sale_to_customer.purchase_date, selling_date: @sale_to_customer.selling_date, serial_no: @sale_to_customer.serial_no, serial_number: @sale_to_customer.serial_number, telephone: @sale_to_customer.telephone, town: @sale_to_customer.town, updated_at: @sale_to_customer.updated_at, url: @sale_to_customer.url }
    end

    assert_redirected_to sale_to_customer_path(assigns(:sale_to_customer))
  end

  test "should show sale_to_customer" do
    get :show, id: @sale_to_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale_to_customer
    assert_response :success
  end

  test "should update sale_to_customer" do
    patch :update, id: @sale_to_customer, sale_to_customer: { accessory_id: @sale_to_customer.accessory_id, address: @sale_to_customer.address, brand_id: @sale_to_customer.brand_id, city: @sale_to_customer.city, created_at: @sale_to_customer.created_at, customer_id: @sale_to_customer.customer_id, customer_note: @sale_to_customer.customer_note, dob: @sale_to_customer.dob, email: @sale_to_customer.email, equipment_id: @sale_to_customer.equipment_id, first_name: @sale_to_customer.first_name, last_name: @sale_to_customer.last_name, mobile: @sale_to_customer.mobile, model_id: @sale_to_customer.model_id, name: @sale_to_customer.name, post_code: @sale_to_customer.post_code, price: @sale_to_customer.price, purchase_date: @sale_to_customer.purchase_date, selling_date: @sale_to_customer.selling_date, serial_no: @sale_to_customer.serial_no, serial_number: @sale_to_customer.serial_number, telephone: @sale_to_customer.telephone, town: @sale_to_customer.town, updated_at: @sale_to_customer.updated_at, url: @sale_to_customer.url }
    assert_redirected_to sale_to_customer_path(assigns(:sale_to_customer))
  end

  test "should destroy sale_to_customer" do
    assert_difference('SaleToCustomer.count', -1) do
      delete :destroy, id: @sale_to_customer
    end

    assert_redirected_to sale_to_customers_path
  end
end
