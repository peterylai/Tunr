FactoryGirl.define do
  factory :artist do
    name { Faker::Name.name }
    genre "Pop"
    photo_url "http://www.google.com"
  end
end