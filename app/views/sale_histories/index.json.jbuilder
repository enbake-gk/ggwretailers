json.array!(@sale_histories) do |sale_history|
  json.extract! sale_history, :id, :equipment_id, :serial_no, :brand_id, :model_id, :customer_id, :selling_date
  json.url sale_history_url(sale_history, format: :json)
end
