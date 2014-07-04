json.array!(@colours) do |colour|
  json.extract! colour, :id, :name, :user_id
  json.url colour_url(colour, format: :json)
end
