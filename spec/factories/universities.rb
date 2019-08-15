FactoryBot.define do
  factory :university do
    name { "Harvard University" }
    location { "Cambridge, MA" }
    email { "harvard@harvard.edu" }
    password { "password" }
    password_confirmation { "password" }
  end
end
