json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :name, :url, :price, :user_id, :brand_id, :model_id, :accessory_id, :first_name, :last_name, :address, :town, :city, :post_code, :telephone, :mobile, :email, :dob, :customer_note, :purchase_date
  json.url equipment_url(equipment, format: :json)
end
