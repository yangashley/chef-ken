module RecipesHelper
  def recipe_measures(recipe)
    @ingredients = []
    @quantities = []
    @units = []
    recipe.measures.each do |contents|
      @ingredients.push(contents.ingredient)
      @quantities.push(contents.quantity)
      @units.push(contents.units)
    end
    @single = @ingredients.zip(@quantities, @units)
  end


  def recipe_owner?(recipe)
    current_user.id == recipe.user_id
  end

end
