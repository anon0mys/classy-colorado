FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    body "Body"
    association :author, factory: :admin
  end
end
