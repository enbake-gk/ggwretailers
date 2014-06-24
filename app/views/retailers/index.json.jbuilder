json.array!(@retailers) do |retailer|
  json.extract! retailer, :id, :contact_person, :website, :retailer_name, :phone_number, :email, :password, :password_confirmation
  json.url retailer_url(retailer, format: :json)
end
