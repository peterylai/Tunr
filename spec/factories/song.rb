FactoryGirl.define do
  factory :song do
    title { Faker::Lorem.words(3).join(" ")}
    year 2001
    price 1.99
    association :artist
  end
end