FactoryBot.define do
  factory :registration_key do
    user
    combination { 'Mystring' }
  end
end
