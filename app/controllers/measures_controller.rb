class MeasuresController < ApplicationController
  # def new
  #   # @recipe = Recipe.find_by(id: params[:recipe_id])
  #   @measure = Measure.new
  #   puts "IM IN MESURES"
  # end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @measure = @recipe.measures.new(measure_deets)
    if @measure.save
      redirect_to recipe_path(@recipe)
    else
      raise 'ur dum'
    end
  end

  private
  def measure_deets
    params[:measure][:units] = params[:units]
    params.require(:measure).permit(:quantity, :ingredient, :units)
  end
end
