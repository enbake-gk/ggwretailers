json.array!(@accessories) do |accessory|
  json.extract! accessory, :id, :name, :url, :price, :user_id
  json.url accessory_url(accessory, format: :json)
end
