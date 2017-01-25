class Recipe < ApplicationRecord
  has_many :measures
  has_many :ingredients, through: :measures
end
