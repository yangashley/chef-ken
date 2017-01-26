module RecipesHelper
  def recipe_contents(recipe)
    # example in progress
    @units = []
    recipe.measures.each do |contents|
      @units.push(contents.units)
    end
    @units
  end

end
