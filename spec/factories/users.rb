FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@mail.com" }
    password "password"
  end

  factory :admin, class: User do
    sequence(:email) { |n| "admin#{n}@mail.com" }
    password 'password'
    role 1
  end
end
