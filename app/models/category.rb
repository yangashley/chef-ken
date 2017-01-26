class Category < ApplicationRecord
  validates :name, presence: true

  has_many :recipes
  has_many :recipe_ratings, through: :recipes, source: :ratings
  def top_5
    self.recipes.sort{|a, b| a.aggregate_rating <=> b.aggregate_rating}.reverse[0..4]
  end
end
