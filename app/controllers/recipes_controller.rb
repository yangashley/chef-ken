class RecipesController < ApplicationController
  include SessionsHelper
  include RecipesHelper

  def new
    @recipe = Recipe.new
    get_category
  end

  def create
    @recipe = get_category.recipes.new(recipe_params)
    current_user.recipes << @recipe

    if @recipe.save
      flash.notice = "Your recipe has been added!"

      redirect_to category_path(@category), notice: "You recipe was successfully added!"
    else
      render :new
    end
  end

  def show
    if get_recipe
      if logged_in
        get_recipe
        render :show
      else
        render :show
      end
    else
      render file: 'public/404.html'
    end
  end

  def edit
  end

  def destroy
    get_recipe
    if recipe_owner?(@recipe)
      get_recipe
      Recipe.destroy(@recipe)
      flash[:notice] = "The recipe has been deleted."
      redirect_to @recipe.category
    else
      render file: 'public/404.html'
    end
  end


  private

  def recipe_params

    params.require(:recipe).permit(:title, :category_id, :user_id, :directions, :time, :difficulty)
  end

  # Utilitized when recipes are nested in categories
  def get_category
    @category ||= Category.find_by(id: params[:category_id])
  end

  def get_recipe
    @recipe ||= Recipe.find_by(id: params[:id])
  end


end
