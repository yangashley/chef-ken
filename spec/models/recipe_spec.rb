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
  user_info = {name: 'test', }
  cat_info = {name: 'Desert'}
  let(:no_url){{title: 'Banana', user_id: 1, time: 1, difficulty: 'Easy', directions: 'Peel and eat!'}}
  let(:has_url){{title: 'Cake', user_id: 1, time: 90, difficulty: 'Medium', directions: 'Preheat the oven to 375, Add flour, egg, and sugar into a bowl and mix thoroughly. Add some other shit, like carrots? Add carrots its a carrot cake. I dunno what to tell you, its a cake', image_url: 'http://happybirthdaycakeimages.com/wp-content/uploads/2015/05/Vanilla-Birthday-Cake.jpg'}}
  let(:test_user){User.create!(user_info)}
  let(:test_category){Category.create!(cat_info)}
  describe "image url" do
    describe "getters setters and validations" do
      it 'has a default image url' do
        banana = test_category.recipes.create!(no_url)
        expect(banana.image_url).to eq 'http://i.imgur.com/VDI7NXx.jpg'
      end

      it 'has a writtable image url' do
        cake = test_category.recipes.create!(has_url)
        expect(cake.image_url).to eq 'http://happybirthdaycakeimages.com/wp-content/uploads/2015/05/Vanilla-Birthday-Cake.jpg'
      end
    end

    describe 'validations' do
        let(:invalid_url){{ user_id: 1, time: 90, difficulty: 'Medium',
                    directions: 'Preheat the oven to 375, Add flour, egg, and sugar into a bowl and mix thoroughly. Add some other shit, like carrots? Add carrots its a carrot cake. I dunno what to tell you, its a cake',
                    image_url: 'http://not a url'}}
      it 'refuses non-urls fields' do
        expect(test_category.recipes.new(invalid_url).save).to eq false
      end

      it 'lets ppl know how they fucked up' do
        recipe = test_category.recipes.new(invalid_url)
        recipe.save
        expect(recipe.errors.full_messages).to include('Image url Must be blank or a valid image url')
      end
    end

  end

  describe 'recipe deletion' do
    it 'A user can only delete a recipe they created' do

    end
  end
  
end
