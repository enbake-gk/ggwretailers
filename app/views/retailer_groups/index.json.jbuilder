json.array!(@retailer_groups) do |retailer_group|
  json.extract! retailer_group, :id, :name
  json.url retailer_group_url(retailer_group, format: :json)
end
