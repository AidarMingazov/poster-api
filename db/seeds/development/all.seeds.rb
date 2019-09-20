require 'factory_girl_rails'

users_seeds = [
  { email: "aamingazov@gmail.com" },
  { email: "example1@example.com" },
  { email: "example2@example.com" }
]

users_seeds.map do |user|
  FactoryGirl.create :user, email: user[:email]
end

15.times do
  FactoryGirl.create :post, user: User.all.sample
end

30.times do
  FactoryGirl.create :comment, user: User.all.sample, post: Post.all.sample
end

