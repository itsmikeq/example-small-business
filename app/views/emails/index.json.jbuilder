json.array!(@emails) do |email|
  json.extract! email, :id, :address, :customer_id
  json.url email_url(email, format: :json)
end
