# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   client = Yelp::Client.new({ consumer_key: ENV["YELP_KEY"],
                            consumer_secret:  ENV["YELP_SECRET"],
                            token:  ENV["YELP_TOKEN"],
                            token_secret:  ENV["YELP_TOKEN_SECRET"]
                          })

cat_ice_cream = Category.create!(name: 'Ice Cream')
response_ice_cream = client.search('New York', { term: 'ice cream' })
response_ice_cream.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id, category_id: cat_ice_cream.id)
end

cat_chocolate = Category.create!(name: 'Chocolate')
response_chocolate = client.search('New York', { term: 'chocolate' })
response_chocolate.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id, category_id: cat_chocolate.id)
end

cat_cake = Category.create!(name: 'Cake')
response_cake = client.search('New York', { term: 'cake' })
response_cake.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id, category_id: cat_cake.id)
end

cat_pie = Category.create!(name: 'Pie')
response_pie = client.search('New York', { term: 'pie' })
response_pie.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id, category_id: cat_pie.id)
end

cat_cookies = Category.create!(name: 'Cookies')
response_cookies = client.search('New York', { term: 'cookie' })
response_cookies.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id, category_id: cat_cookies.id)
end

cat_donuts = Category.create!(name: 'Donuts')
response_donuts = client.search('New York', { term: 'donut' })
response_donuts.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id, category_id: cat_donuts.id)
end

cat_candies = Category.create!(name: 'Candies')
response_candies = client.search('New York', { term: 'candy' })
response_candies.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id, category_id: cat_candies.id)
end

cat_pastries = Category.create!(name: 'Pastries')
response_pastries = client.search('New York', { term: 'pastry' })
response_pastries.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id, category_id: cat_pastries.id)
end


