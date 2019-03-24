FactoryGirl.define do
  factory :comment do
    association :user
    association :post

    text { Faker::Lorem.words(4) }
  end
end
