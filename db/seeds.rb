require 'json'
require 'open-uri'
require 'faker'

Bookmark.delete_all
Movie.delete_all
List.delete_all

    # OPTION 1 : Faker

# 10.times do
#   Movie.create(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     rating: rand(1..5)
#   )
# end

# t.string "title"
# t.string "overview"
# t.text "poster_url"
# t.float "rating"

    # OPTION 2 : parsing API

url = "https://tmdb.lewagon.com/movie/top_rated"

user_serialized = URI.open(url).read
response = JSON.parse(user_serialized)

movies = response["results"]

movies.each do |movie|
  movie = Movie.new(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie["vote_average"]
  )
  movie.save
  puts "[#{movie.title}] #{movie.overview} - #{movie.rating} - #{movie.poster_url}"
end

    # OPTION 3 : BASIC SEEDS

# puts "starting!"
# Bookmark.delete_all
# Movie.delete_all
# List.delete_all

# puts "creating movies"
# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# puts "creating lists"
# List.create(name: "Drama Queen")
# List.create(name: "Pour les jours de pluie")
# List.create(name: "Pour les jours ensoleillés")


puts "done!"
