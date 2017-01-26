require 'rails_helper'

RSpec.describe Measure, type: :model do
  describe "amount of ingredient" do
    user_info = {name: 'test', }
    cat_info = {name: 'Desert'}
    rec_info = {title: 'banana bread', category_id: 1,
                user_id: 1, time: 60, difficulty: 'Easy',
               directions: 'Make the banana bread' }
    ing_info = {name: 'bananas'}
    meas_info = {recipe_id: 1, ingredient_id: 1, quantity: 2, units: 'Cup'}
    let(:test_user){User.create!(user_info)}
    let(:test_cat){Category.create!(cat_info)}
    let(:test_recipe){Recipe.create!(rec_info)}
    let(:test_measure){Measure.create!(meas_info)}
    let(:test_ingredient){Ingredient.create!(ing_info)}

    it 'returns a string of the quant and units of its ingredient' do
      expect(test_measure.pretty_print_ammount).to eq "2 Cups of bananas"
    end
  end
end
