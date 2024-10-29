require 'open-uri'

puts "Cleaning database..."
Cafe.destroy_all

puts "Grabbing Cafes"
url = 'https://gist.githubusercontent.com/yannklein/5d8f9acb1c22549a4ede848712ed651a/raw/3daec24bcd833f0dd3bcc8cee8616a731afd1f37/cafe.json'

# http request to get JSON data from gh
json_cafes = URI.open(url).read

# convert to ruby object
cafes = JSON.parse(json_cafes)

# iterate over each cafe and create a new record in the database
cafes.each do |cafe|
  Cafe.create!(
    title: cafe['title'],
    address: cafe['address'],
    picture: cafe['picture'],
    hours: cafe['hours'],
    criteria: cafe['criteria']
  )

  puts "created #{cafe['title']}"
end

puts "Finished #{Cafe.count} cafes created"
