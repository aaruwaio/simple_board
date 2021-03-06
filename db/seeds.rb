User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.characters(16)
  users.each { |user| user.topics.create!(title: title) }
end

user = User.first
topics = Topic.order(:created_at).take(6)
50.times do
  body = Faker::Lorem.characters(16)
  topics.each { |topic| topic.posts.create!(body: body, user_id: user.id) }
end
