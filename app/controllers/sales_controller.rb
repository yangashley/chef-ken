class SalesController < ApplicationController
  def create
    @sale = Sale.new(sale_deets)
    if @sale.save
      redirect @sale.recipe
    else

    end
  end

  def update
    @sale = Sale.find_by(sale_deets)
  end

  private
  def sale_deets
    params.require(:sale).permit(:recipe_id, :volume, :price)
  end
end
