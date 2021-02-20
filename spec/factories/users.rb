FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    username  { Faker::Internet.username(separators: %w()) }
    email     { Faker::Internet.email }
    password  { "password" }

    trait :with_tweets do
      after(:create) do |user, _evaluator|
        create_list(:tweet, rand(2..5), user: user)
        user.reload
      end
    end
  end
end
