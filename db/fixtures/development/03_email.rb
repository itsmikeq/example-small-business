Customer.all.each do |c|
  Email.seed do |e|
    e.address = Faker::Internet.email
    e.customer = c
  end
end