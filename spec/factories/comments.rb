FactoryGirl.define do
  factory :comment do
    association :user
    association :post

    text { Faker::Lorem.sentence }
  end
end
