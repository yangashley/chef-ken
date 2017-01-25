class Recipe < ApplicationRecord
  belongs_to :category

  has_many :measures
  has_many :ingredients, through: :measures
  
  validates :title, :category_id, :user_id, :time, :difficulty, :directions, presence: true

end
