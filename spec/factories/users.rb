FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    username  { Faker::Internet.username(separators: %w()) }
    email     { Faker::Internet.email }
    password  { "password" }
  end
end
