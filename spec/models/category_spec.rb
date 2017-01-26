require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:tester_category){Category.create!({name: 'Desert'})}
  let(:tester){User.create!({name: 'test', email: 'test@test.test', password:'test'})}
  let(:test_setup){
    Class.new{
      def self.setup(test_user, test_cat)
            # puts '1'
      # puts test_cat
      6.times do
         recipe_info = {
          title: ['woot','we rockin', 'failer', 'brailer', 'sailer', 'yo'],
          user_id: test_user.id,
          time: (1..90).to_a.sample,
          difficulty: ["easy", "medium", "hard"].sample,
          directions: Faker::Lorem.sentence
         }
        test_cat.recipes.create!(recipe_info)
      end
      # puts '2'
      10.times do
        rating_info = {
          recipe_id: test_cat.recipes.sample.id,
          stars: (1..5).to_a.sample
        }

        test_user.ratings.create!(rating_info)
      end
    end
    }
  }

  describe "#top 5" do
    before(:each){test_setup.setup(tester, tester_category)}
    it 'returns only 5 recipes' do
      expect(tester_category.top_5.length).to eq 5
    end

    it 'orders the results by ratings' do
      expect(tester_category.top_5[0].aggregate_rating).to be >= tester_category.top_5[1].aggregate_rating
    end

  end
end
