class Recipe < ApplicationRecord
  belongs_to :category

  has_many :measures

  validates :title, :category_id, :user_id, :time, :difficulty, :directions, presence: true

end
