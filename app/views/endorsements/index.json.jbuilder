json.array!(@endorsements) do |endorsement|
  json.extract! endorsement, :id, :endorsement, :customer_id, :approved
  json.url endorsement_url(endorsement, format: :json)
end
