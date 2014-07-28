json.array!(@parts) do |part|
  json.extract! part, :id, :model_id, :name, :barcode
  json.url part_url(part, format: :json)
end
