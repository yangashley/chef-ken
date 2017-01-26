require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let (:recipe) {Recipe.new(title: "Banana Bread", category_id: 4, user_id: 1, time: 60, difficulty: "Easy", directions: "Mix ingredients. Bake at 350 degrees for 50 minutes.")}

  describe 'attributes' do
    it 'has a title' do
      expect(recipe.title).to eq "Banana Bread"
    end
    it 'has a category_id' do
      expect(recipe.category_id).to eq 4
    end
    it 'has a user_id' do
      expect(recipe.user_id).to eq 1
    end
    it 'has a cook time' do
      expect(recipe.time).to eq 60
    end
    it 'has a difficulty level' do
      expect(recipe.difficulty). to eq "Easy"
    end
    it 'has directions' do
      expect(recipe.directions).to eq "Mix ingredients. Bake at 350 degrees for 50 minutes."
    end
  end
end
