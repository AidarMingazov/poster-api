FactoryGirl.define do
  factory :post do
    association :user

    body { Faker::Lorem.paragraph(3) }
    title { Faker::Lorem.words(4) }
    slug { "#{Faker::Name.first_name}#{Faker::Number.number(5)}" }
  end
end
