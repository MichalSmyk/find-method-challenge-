# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'
require_relative 'lib/recipe'
# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
recipe_repository = RecipeRepository.new


# Print out each recipe from the result set .
# recipe_repository.all.each do |recipe|
#   p "#{recipe.id} - #{recipe.recipe_name} - #{recipe.cooking_time} - #{recipe.rating} "
# end

#print a recipe based on given id 

recipe = recipe_repository.find(1)
puts recipe.recipe_name