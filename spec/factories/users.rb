FactoryBot.define do
  factory :user do
    email { "harvard@harvard.edu" }
    password { "password" }
    password_confirmation { "password" }
  end
end
