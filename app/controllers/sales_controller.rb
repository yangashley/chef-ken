class SalesController < ApplicationController
  def index
    @rating = Rating.new
    @recipe = Recipe.find_by(id: recipe_params[:recipe_id])
    @sale = Sale.new
    render 'recipes/show'
  end

  def create
    @sale = Sale.new(sale_deets)
    @sale.recipe_id = recipe_params[:recipe_id]
    raise @sale.inspect
    if @sale.save
      flash[:notice] = 'Success!'
      redirect_to :index
    else
      flash[:alert] = "Save failed!"
      redirect_to :index
    end
  end

  def update
    @sale = Sale.find_by(sale_deets)
  end

  private
  def sale_deets
    params.require(:sale).permit(:volume, :sale_price)
  end

  def recipe_params
    params.permit(:recipe_id)
  end
end
