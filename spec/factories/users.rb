FactoryBot.define do
  factory :user do
    email { 'harvard@harvard.edu' }
    name { 'user_name' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end