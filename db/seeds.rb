# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts "Turning into a Wizard"

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
data = JSON.parse(open(url).read)

ingredients = data["drinks"]

puts Ingredient.all.count

ingredients.each do |ingredient|
  Ingredient.find_or_create_by!(name: ingredient["strIngredient1"])
  puts "Creating Ingredients Out Of Thin Air"
end

puts Ingredient.all.count

puts "Finished Creating Ingredients!"
