json.array!(@sale_to_customers) do |sale_to_customer|
  json.extract! sale_to_customer, :id, :equipment_id, :serial_no, :brand_id, :model_id, :customer_id, :selling_date, :created_at, :updated_at, :name, :url, :price, :accessory_id, :first_name, :last_name, :address, :town, :city, :post_code, :telephone, :mobile, :email, :dob, :customer_note, :purchase_date, :serial_number
  json.url sale_to_customer_url(sale_to_customer, format: :json)
end
