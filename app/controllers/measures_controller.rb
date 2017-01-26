class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @measure = Measure.new
  end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @measure = @recipe.measures.new(measure_deets)
    if @measures.save
      redirect_to new_recipe_measure_path(@recipe)
    else
      raise 'ur dum'
    end
  end

  private
  def measure_deets
    raise "Here's where you need to pick back up tomorrow"
    params.require(:measure).permit(:quantity,:units,:ingredient)
  end
end
