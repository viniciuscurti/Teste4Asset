FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
