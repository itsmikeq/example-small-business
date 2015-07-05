json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :state, :zip_code
  json.url address_url(address, format: :json)
end
