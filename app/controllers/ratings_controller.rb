class RatingsController < ApplicationController
  include SessionsHelper
  include RatingsHelper

  def create
    get_recipe
    if !already_rated?(@recipe)
      @rating = @recipe.ratings.new(rating_params)
      @rating.update_attributes(user_id: current_user.id)
      if @rating.save
        flash[:notice] = "Rating has been recorded."

        redirect_to recipe_path(@recipe)
      else
        render file: 'public/404.html'
      end
    else
      render file: 'public/404.html'
    end
  end


  private

  def rating_params
    params.require(:rating).permit(:user_id, :recipe_id, :stars)
  end

  def get_recipe
    @recipe ||= Recipe.find_by(id: params[:recipe_id])
  end
end
