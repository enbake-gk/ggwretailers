json.array!(@models) do |model|
  json.extract! model, :id, :brand_id, :name, :color, :manufacturer, :warranty, :image, :user_id
  json.url model_url(model, format: :json)
end
