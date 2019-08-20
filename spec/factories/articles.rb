FactoryBot.define do
  factory :article do
    title { "MyString" }
    body { "MyText" }
    author { "MyString" }
    association :user
  end
end
