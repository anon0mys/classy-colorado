FactoryBot.define do
  factory :user do
    sequence(:email) { "test#{Random.rand(10000).to_s}@mail.com" }
    password "password"
  end

  factory :admin, class: User do
    sequence(:email) { "admin#{Random.rand(10000).to_s}@mail.com" }
    password 'password'
    role 1
  end
end
