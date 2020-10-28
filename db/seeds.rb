100.times do |i|
  user = User.create!(
    name: Faker::Name.name ,
    email: "user#{i+1}@test.com",
    password: '123123'
  )

  10.times do
    post = user.posts.create!(
      title: Faker::Hipster.sentence,
      body: Faker::Hipster.paragraph(sentence_count: rand(4..8)),
      user_id: i
    )
  end
end

last_5_posts = Post.last(5)

last_5_posts.each do |post|
  10.times do
    Comment.create!(
      user: User.find(rand(1..10)),
      post: post,
      text: Faker::Hipster.paragraph(sentence_count: rand(4..8))
    )
  end
end

puts "100 users created"
puts "1000 posts created"
puts "comments created"
