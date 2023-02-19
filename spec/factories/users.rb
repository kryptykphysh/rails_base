FactoryBot.define do
  factory :user do
    first_name { "Test" }
    surname { "User" }
    email { Faker::Internet.unique.email domain: "imperosoftware.com" }
    password { "Password123" }
    password_confirmation { "Password123" }
  end
end
