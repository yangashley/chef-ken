module RatingHelper
  def recipe_rating(recipe)
    total = 0
    recipe.ratings.each do |rating|
      total += rating.stars
    end
    average = (total.to_f / recipe.ratings.count.to_f).round(2)
  end

end
