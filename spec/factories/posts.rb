FactoryBot.define do
  factory :post do
    title "MyString"
    body "MyText"
    association :author_id, factory: :admin
  end
end
