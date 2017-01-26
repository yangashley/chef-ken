class RecipesController < ApplicationController
  include SessionsHelper

  def new
    @recipe = Recipe.new
    get_category
  end

  def create
    raise recipe_params.inspect
    @recipe = Recipe.new(recipe_params)
    get_category
    p params
    puts "ABOVEEEEEEEE"
    if @recipe.save
      flash.notice = "Your recipe has been added!"

      redirect_to categories_show_path() # Will need to add category_id wildcard
    else
      puts "FAIL"
      flash.alert = "Please amend the following:"
      render :new
    end
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
    raise params.inspect
    params[:recipe][:user_id] = current_user.id
    params[:recipe][:category_id] = get_category.id
    params.require(:recipe).permit(:title, :category_id, :user_id, :directions, :time, :difficulty)
  end

  # Utilitized when recipes are nested in categories
  def get_category
    @category = Category.find(params[:category_id])
  end
end
