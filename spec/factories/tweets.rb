FactoryBot.define do
  factory :tweet do
    content { Faker::Lorem.sentence }
  end
end