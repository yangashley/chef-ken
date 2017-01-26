class CategoriesController < ApplicationController
  include ApplicationHelper

  def index
    @categories = {
    apps:  Category.find_by(name: "Appetizers").top_5[0..4],
    salads:  Category.find_by(name: "Salads").top_5[0..4],
    mains:  Category.find_by(name: "Main Dishes").top_5[0..4],
    desserts:  Category.find_by(name: "Desserts").top_5[0..4]
    }
  end

  def show
    @category = Category.find_by(name: params[:id])
    @recipes = @category.recipes
  end


end
