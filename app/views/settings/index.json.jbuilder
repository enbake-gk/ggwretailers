json.array!(@settings) do |setting|
  json.extract! setting, :id, :first_name, :last_name, :email, :admin
  json.url setting_url(setting, format: :json)
end
