require 'faker'

# Recipes

20.times do
 recipe_info{
  title: ,
  category_id: (1..4).to_a.sample,
  user_id: (1..10).to_a.sample,
  time: Faker::Time.between(Time.now - 1, Time.now),
  difficulty: ["easy", "medium", "hard"].sample,
 }
 Recipe.create(recipe_info)
end


# Users
10.times do
  user_info = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  }
  User.create(user_info)
end

# Categories
Category.create(name: "Appetizers")
Category.create(name: "Salads")
Category.create(name: "Main Dishes")
Category.create(name: "Desserts")

# Ingredients
50.times do
  ingredient_info = {
    name: Faker::Food.ingredient
  }
  Ingredient.create(ingredient_info)
end

# Measures
20.times do
  measures_info = {
    name: Faker::Food.measurement
  }
  Measure.create(measures_info)
end

