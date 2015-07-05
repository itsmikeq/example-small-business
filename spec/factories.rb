include ActionDispatch::TestProcess
FactoryGirl.define do
  sequence :sentence, aliases: [:title, :content, :description] do
    Faker::Lorem.sentence
  end

  sequence :name, aliases: [:file_name] do
    Faker::Name.name
  end

  sequence(:url) { Faker::Internet.uri('http') }

  sequence(:san_antonio_ip){ "12.52.92." + (1..255).collect{|e| e}.sample}
  sequence(:austin_ip){ "12.161.75." + (1..255).collect{|e| e}.sample}


end
