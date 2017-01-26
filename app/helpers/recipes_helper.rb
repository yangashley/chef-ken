module RecipesHelper
  def recipe_measures(recipe)
    @ingredients = []
    @quantities = []
    @units = []
    recipe.measures.each do |contents|
      @quantities.push(contents.quantity)
      @units.push(contents.units)
      @ingredients.push(contents.ingredient)
    end
    @single = @quantities.zip(@units, @ingredients)
  end


  def recipe_owner?(recipe)
    session[:user_id] == recipe.user_id
  end

end
