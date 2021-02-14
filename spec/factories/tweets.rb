FactoryBot.define do
  factory :tweet do
    content { Faker::Lorem.sentence }
    association :user

    trait :with_comments do
      after(:create) do |tweet, _evaluator|
        create_list(:comment, rand(2..5), tweet: tweet)
        tweet.reload
      end
    end
  end
end
