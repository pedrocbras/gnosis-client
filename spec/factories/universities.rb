FactoryBot.define do
  factory :university do
    #name { "Harvard University" }
    email { "harvard@harvard.edu" }
    password { "password" }
    password_confirmation { "password" }
  end
end
