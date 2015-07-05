(1..50).each do |i|
  Customer.seed do |c|
    c.first_name = Faker::Name.first_name
    c.last_name = Faker::Name.last_name
  end
end
