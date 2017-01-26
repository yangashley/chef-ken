class CategoriesController < ApplicationController
  include ApplicationHelper

  def index
    @appetizers = Category.find_by(name: "Appetizers").recipes
    @salads = Category.find_by(name: "Salads").recipes
    @main_dishes = Category.find_by(name: "Main Dishes").recipes
    @desserts = Category.find_by(name: "Desserts").recipes
  end


end
