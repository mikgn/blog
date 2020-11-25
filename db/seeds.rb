hashtags = [
  '#love', '#instagood', '#photooftheday', '#fashion',
  '#beautiful', '#happy', '#cute', '#tbt',
  '#like4like', '#followme', '#picoftheday', '#follow',
  '#me', '#selfie', '#summer', '#art',
  '#instadaily', '#friends', '#repost', '#nature',
  '#girl', '#fun', '#style', '#smile',
  '#food', '#instalike', '#likeforlike', '#family',
  '#travel', '#fitness', '#igers', '#tagsforlikes',
  '#follow4follow', '#nofilter', '#life', '#beauty',
  '#amazing', '#instamood', '#instagram', '#photography'
]

10_000.times do |i|
  user = User.create!(
    name: "#{Faker::Name.name}#{i}",
    email: "user#{i+1}@test.com",
    password: '123123'
  )

  5.times do
    post = user.posts.create!(
      title: Faker::Hipster.sentence,
      body: Faker::Hipster.paragraph(sentence_count: rand(4..8)),
      user_id: i
    )
  end

  # posts with hashtag
  3.times do
    post = user.posts.create!(
      title: Faker::Hipster.sentence,
      body: "#{hashtags.sample } " + Faker::Hipster.paragraph(sentence_count: rand(4..8)),
      user_id: i
    )
  end

  # posts with 2 hashtags
  2.times do
    post = user.posts.create!(
      title: Faker::Hipster.sentence,
      body: "#{hashtags.sample } " + "#{hashtags.sample } " + Faker::Hipster.paragraph(sentence_count: rand(4..8)),
      user_id: i
    )
  end
end

puts "10_000 users created"
puts "100_000 posts with hashtags created"

users = User.all
posts = Post.all

500_000.times do
  Comment.create(
    text: Faker::Hipster.paragraph(sentence_count: rand(2..6)),
    user: users.sample,
    post: posts.sample
  )
end

puts "500_000 comments created"
