class RatingsController < ApplicationController
  include SessionsHelper

  def create
    get_recipe
    p rating_params
    if already_rated?(@recipe)
      # Params need to go to edit action.
      redirect_to action: 'edit'
    else
      @rating = @recipe.ratings.new(rating_params)
      @rating.update_attributes(user_id: current_user.id)
      if @rating.save
        flash[:notice] = "Rating has been recorded."

        redirect_to recipe_path(@recipe)
      else
        render file: 'public/404.html'
      end
    end
  end

  def edit
    puts "In Edit"
  end


  private

  def rating_params
    params.require(:rating).permit(:user_id, :recipe_id, :stars)
  end

  def already_rated?(recipe)
    !!recipe.ratings.find_by(user_id: current_user.id)
  end

  def get_recipe
    @recipe ||= Recipe.find_by(id: params[:recipe_id])
  end
end
