FactoryBot.define do
  factory :post do
    title "MyString"
    body "MyText"
    association :author, factory: :admin
  end
end
