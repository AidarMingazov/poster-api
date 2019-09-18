FactoryGirl.define do
  factory :rating do
    association :user
    association :post

    point 3
  end
end
