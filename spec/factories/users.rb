FactoryBot.define do
  factory :user do
    email { 'harvard@harvard.edu' }
    name { 'Harvard University' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end