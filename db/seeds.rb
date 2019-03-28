require 'factory_girl_rails'

25.times do
  User.create!(email: Faker::Internet.email,
              password: Faker::Internet.password,
              full_name: Faker::Name.first_name)
end

50.times do
  FactoryGirl.create :post, user: User.find(rand(1..User.count))
end

50.times do
  FactoryGirl.create :comment, user: User.find(rand(1..User.count)), post: Post.find(rand(1..Post.count))
end
