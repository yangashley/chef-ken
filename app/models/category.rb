class Category < ApplicationRecord
  validates :name, presence: true

  has_many :recipes
  has_many :recipe_ratings, through: :recipes, source: :ratings
  def top_5
    ordered = self.recipes.sort{|a, b| a.aggregate_rating <=> b.aggregate_rating}
    ordered.reverse.collect{|r| {title: r.title, image_url: r.image_url, id: r.id, rating: r.aggregate_rating}}
  end
end
