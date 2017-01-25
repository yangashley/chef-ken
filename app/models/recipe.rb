class Recipe < ApplicationRecord
  validates :title, :category_id, :user_id, :time, :difficulty, :directions, presence: true

  belongs_to :category
end
