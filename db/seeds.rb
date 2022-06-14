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
  description = Faker::Quotes::Shakespeare.hamlet_quote
  subject = ["science", "history", "maths"].sample
  topic = ["biology", "physics", "chemistry"].sample
  level = ["ks1", "ks2", "gcse"].sample
  Deck.create!(name: name, user: user, subject: subject, topic: topic, level: level, description: description)
  rating = rand(1..5)
  Rating.create!(rating: rating, user: User.find(user_list.sample), deck: Deck.last)
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

#######################################################
# require "nokogiri"
# require "open-uri"


# url = "https://www.chegg.com/flashcards/subjects"
# content = URI.open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'opera')
# doc = Nokogiri::HTML(content)
# doc.search(".sc-16yfi4m-3").each do |sub|
#   subject_link = sub['href']
#   url_sub = "https://www.chegg.com#{subject_link}"
#   content = URI.open(url_sub, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'opera')
#   doc = Nokogiri::HTML(content)
#   doc.search('.o0oozh-0').each do |deck|
#     deck_link = deck['href']
#     content = URI.open(deck_link, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'opera')
#     doc = Nokogiri::HTML(content)
#     subject = doc.search('.eQcgIs span').text.strip
#     topic = doc.search('.hJCkqP span').text.strip
#     deck.search('.bwjqlo-0').each do |card|
#       puts card
#     end
#   end
# end

# url = "https://www.flashcardmachine.com/religion-chapter19.html#cards"
# content = URI.open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'opera')
# doc = Nokogiri::HTML(content)

# doc.search('tr')[1..].each do |card|
#   card.search("td tr td b").each_slice(2) do |q,a|
#     puts "Q: #{q}"
#     puts "A: #{a}"
#   end
# end
