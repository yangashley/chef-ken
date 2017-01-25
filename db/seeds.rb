require 'faker'

# Categories
Category.create(name: "Appetizers")
Category.create(name: "Salads")
Category.create(name: "Main Dishes")
Category.create(name: "Desserts")

# Recipes
20.times do
 recipe_info = {
  title: Faker::Lorem.word,
  category_id: (1..4).to_a.sample,
  user_id: (1..10).to_a.sample,
  time: Faker::Time.between(Time.now - 1, Time.now),
  difficulty: ["easy", "medium", "hard"].sample,
  directions: Faker::Lorem.sentence
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
  recipe_id: (1..20).to_a.sample,
  ingredient_id: (1..50).to_a.sample,
  quantity: (1..10).to_a.sample
  }
  Measure.create(measures_info)
end

