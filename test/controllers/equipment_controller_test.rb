require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { accessory_id: @equipment.accessory_id, address: @equipment.address, brand_id: @equipment.brand_id, city: @equipment.city, customer_note: @equipment.customer_note, dob: @equipment.dob, email: @equipment.email, first_name: @equipment.first_name, last_name: @equipment.last_name, mobile: @equipment.mobile, model_id: @equipment.model_id, name: @equipment.name, post_code: @equipment.post_code, price: @equipment.price, purchase_date: @equipment.purchase_date, telephone: @equipment.telephone, town: @equipment.town, url: @equipment.url, user_id: @equipment.user_id }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response :success
  end

  test "should update equipment" do
    patch :update, id: @equipment, equipment: { accessory_id: @equipment.accessory_id, address: @equipment.address, brand_id: @equipment.brand_id, city: @equipment.city, customer_note: @equipment.customer_note, dob: @equipment.dob, email: @equipment.email, first_name: @equipment.first_name, last_name: @equipment.last_name, mobile: @equipment.mobile, model_id: @equipment.model_id, name: @equipment.name, post_code: @equipment.post_code, price: @equipment.price, purchase_date: @equipment.purchase_date, telephone: @equipment.telephone, town: @equipment.town, url: @equipment.url, user_id: @equipment.user_id }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end
