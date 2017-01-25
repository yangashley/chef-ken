class CategoriesController < ApplicationController

  def index
    @appetizers = Category.find_by(name: "Appetizers").recipes
    @salads = Category.find_by(name: "Salads").recipes
    @main_dishes = Category.find_by(name: "Main Dishes").recipes
    @desserts = Category.find_by(name: "Desserts").recipes
  end

  def show
    @category = Category.find_by(name: params[:name])
  end

end
