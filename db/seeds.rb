require 'faker'
# seeding 5 users, 10 decks with random question answers

# delete all current users
User.destroy_all
puts "users destroyed"
user_list = []
# seeding users:
User.create!(first_name: "demo", last_name: "user", email: "demo@user.com", password: "password")
puts "test user created. email - demo@user.com, password - password"
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}@#{last_name}.com"
  password = "password"
  User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
  user_list << User.last.id
  puts "User #{email} created"
end
puts "all users created"
# delete all current decks
Deck.destroy_all

10.times do
  name = Faker::Educator.course_name
  user = User.find(user_list.sample)
  subject = ["science", "history", "maths"].sample
  topic = ["biology", "physics", "chemistry"].sample
  level = ["ks1", "ks2", "gcse"].sample
  Deck.create!(name: name, user: user, subject: subject, topic: topic, level: level)
  puts "Created deck '#{name}'"
end
puts "decks seeded"

puts "adding cards to decks"
Deck.all.each do |deck|
  10.times do
    question = "Who said '#{Faker::GreekPhilosophers.quote}'"
    answer = Faker::GreekPhilosophers.name
    Card.create!(question: question, answer: answer, deck: deck)
  end
end

puts "seeding complete"
