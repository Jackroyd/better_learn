require 'faker'
# seeding 20 users

# delete all current users
User.destroy_all
puts "users destroyed"
user_list = []
# seeding users:
User.create!(first_name: "demo", last_name: "user", email: "demo@user.com", password: "password")
puts "test user created. email - demo@user.com, password - password"
20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}@#{last_name}.com"
  password = "password"
  User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
  user_list << User.last.id
end
puts "all users created"


# creating decks
puts "destroying old decks"
Deck.destroy_all
puts "old decks destroyed"
deck_count = 0
puts "creating decks"
url = "https://www.flashcardmachine.com/flashcards.html"
content = URI.open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'opera')
doc = Nokogiri::HTML(content)

doc.search(".fcStaticSubject ul li a").each_with_index do |sub, index|
  next if index.odd?

  href = sub['href']
  puts "begining #{href} decks"
  suburl = "https://www.flashcardmachine.com/#{href}"
  begin
    subcontent = URI.open(suburl, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'opera')
  rescue OpenURI::HTTPError
    next
  end
  subdoc = Nokogiri::HTML(subcontent)

  num_break = rand(2..10)
  subdoc.search(".fcStaticSubject ul li a").each_with_index do |set, i|
    break if i > num_break
    next if i.odd?

    href = set['href']
    seturl = "https://www.flashcardmachine.com/#{href}"
    begin
      setcontent = URI.open(seturl, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'opera')
    rescue OpenURI::HTTPError
      next
    end
    setdoc = Nokogiri::HTML(setcontent)
    name = setdoc.search('.form_item')[0].search('.field').inner_text.gsub!(/\d|-|\.|\//, "")
    break if name.blank?
    name = name.strip.capitalize
    puts name
    description = setdoc.search('.form_item')[1].search('.field').inner_text
    subject = setdoc.search('.form_item')[3].search('.field').inner_text
    level = setdoc.search('.form_item')[4].search('.field').inner_text
    user = user_list.sample
    begin
      Deck.create!(name: name, description: description, subject: subject, level: level, user_id: user)
    rescue ActiveRecord::RecordInvalid
      next
    end
    deck_count += 1
    break_num = rand(8..16)
    setdoc.search('tr')[1..].each_with_index do |card, ind|
      break if ind > break_num
      next if ind.odd?

      card.search("td tr td b").each_slice(2) do |q, a|
        begin
          question = q.inner_text
        rescue NoMethodError
          next
        end
        begin
          answer = a.inner_text
        rescue NoMethodError
          next
        end
        begin
          Card.create!(question: question, answer: answer, deck_id: Deck.last.id)
        rescue ActiveRecord::RecordInvalid
          next
        end
      end
    end
    puts "created #{deck_count} decks"
  end
end

puts "Completed! #{deck_count} decks created"

# create ratings

puts "creating ratings"

Deck.all.each do |deck|
  Rating.create(user_id: user_list.sample, deck_id: deck.id, rating: rand(1..5))
end

puts "ratings created"

puts "all seeding completed"
