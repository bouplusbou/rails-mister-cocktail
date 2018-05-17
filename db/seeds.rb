# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'
require 'open-uri'


# cocktails_scrapped = []
# 70.times do
#   url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
#   cocktail_serialized = open(url).read
#   cocktail = JSON.parse(cocktail_serialized)
#   cocktails_scrapped << cocktail["drinks"].first["strDrink"]
# end
# cocktails = cocktails_scrapped.uniq
# p cocktails

# puts 'Creating 50 cocktails...'
# counter_cocktail = 0
# 50.times do
#   cocktail = Cocktail.new(
#     name: cocktails[counter_cocktail]
#   )
#   counter_cocktail += 1
#   p cocktails[counter_cocktail]
#   p counter_cocktail
#   cocktail.save!
# end
# puts 'Finished!'


ingredients = []
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)
ingredient['drinks'].each { |ing| ingredients << ing.values.join }

puts 'Creating 50 ingredients...'
counter_ing = 0
50.times do
  ingredient = Ingredient.new(
    name: ingredients[counter_ing]
  )
  counter_ing += 1
  ingredient.save!
end
puts 'Finished!'


# puts 'Creating 20 doses...'
# counter = 0
# 20.times do
#   dose = Dose.new(
#     ingredient_id: counter,
#     cocktail_id: counter,
#     description:  ["1cl", "2cl", "3cl", "4cl", "5cl", "6cl", "7cl"].sample
#   )
#   counter += 1
#   dose.save!
# end
# puts 'Finished!'
