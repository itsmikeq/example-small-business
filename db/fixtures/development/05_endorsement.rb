Customer.all.each do |c|
  Endorsement.seed do |t|
    t.endorsement = Faker::Lorem.words(num=100).join(" ")
    t.customer = c
  end
end
