class RecipesController < ApplicationController
  include SessionsHelper

  def new
    @recipe = Recipe.new
    get_category
  end

  def create
    @recipe = Recipe.new(recipe_params)# category_id: get_category.id
    p current_user
    p @recipe
    puts "ABOVEEEEEEEEEEEEEEEEEEEEEEEEEEE"
    # if @recipe.save
    #   flash.notice = "Your recipe has been added!"

      redirect_to categories_show_path() # Will need to add category_id wildcard
    # end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  # Do we need update? What's the difference between #update and #edit?
  # def update
  # end

  private

  def recipe_params
    params[:user_id] = current_user.id
    params.require(:recipe).permit(:title, :category_id, :user_id, :time, :difficulty)
  end

  # Utilitized when recipes are nested in categories
  def get_category
    # @category = Category.find(params: cat_id)
  end
end
