Customer.all.each do |c|
  Address.seed do |a|
    a.city = Faker::Address.city
    a.street = Faker::Address.street_address
    a.state = "Texas"
    a.zip_code = Faker::Address.zip_code
    a.customer = c
  end
end