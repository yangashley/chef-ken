class RecipesController < ApplicationController
  include SessionsHelper


  def new
    @recipe = Recipe.new
    get_category
  end

  def create
    @recipe = Recipe.new(recipe_params)
    get_category
    if @recipe.save
      flash.notice = "Your recipe has been added!"

      redirect_to category_path(@category), notice: "You recipe was successfully added!"
    else
      puts "FAIL"
      flash.alert = "Please amend the following:"
      render :new
    end
  end

  def show
    if logged_in
      get_recipe
      p @recipe = Recipe.find(params[:id])
      render :show
    else
      @error = 'You need to log in to see recipes'
      render :show
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @category = Category.find(@recipe.category_id)
    if current_user.id != @recipe.user_id
      flash[:no_access] = "You do not have permission to edit this recipe."
      redirect_to @recipe
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
  end
  private

  def recipe_params
    params[:recipe][:user_id] = current_user.id
    # These two exist but they're not permitted in recipe for some reason. As a result, we have to manually set it here.
    params[:recipe][:category_id] = get_category.id
    params[:recipe][:difficulty] = params[:difficulty]
    params.require(:recipe).permit(:title, :category_id, :user_id, :directions, :time, :difficulty)
  end

  # Utilitized when recipes are nested in categories
  def get_category
    @category = Category.find(params[:category_id])
  end

  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

end
