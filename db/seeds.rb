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

response = client.search('New York', { term: 'ice cream' })
response.businesses.each do |bus|
  Restaurant.create!(name: bus.name, yelp_id: bus.id)
end
