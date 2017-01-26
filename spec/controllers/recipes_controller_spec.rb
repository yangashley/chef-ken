require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns flash message if user does not have access to edit a recipe" do
      @user = User.create(name: "Danny", email: "danny@gmail.com", password_digest: "password", is_ken: false)
      @current_user = User.create(name: "Ashley", email: "ashley@gmail.com", password_digest: "password", is_ken: false)
      session[:user_id] = @current_user.id
      @category = Category.create(name: "Dessert")
      @recipe = Recipe.create(title: "Banana Bread", category_id: @category.id, user_id: 1, time: 60, difficulty: "Easy", directions: "Mix ingredients. Bake at 350 degrees for 50 minutes.")
      get :edit, category_id: @category.id, id: @recipe.id
      expect(response).to redirect_to recipe_path(@recipe)
      expect(flash[:no_access]).to eq "You do not have permission to edit this recipe."
    end

    it "shows an edit form if user does have access to edit a recipe" do
      @user = User.create(name: "Danny", email: "danny@gmail.com", password_digest: "password", is_ken: false)
      session[:user_id] = @user.id
      @category = Category.create(name: "Dessert")
      @recipe = Recipe.create(title: "Banana Bread", category_id: @category.id, user_id: 1, time: 60, difficulty: "Easy", directions: "Mix ingredients. Bake at 350 degrees for 50 minutes.")
      get :edit, category_id: @category.id, id: @recipe.id
      expect(response).to redirect_to recipe_path(@recipe)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status 200
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      @user = User.create!(name: "Danny", email: "danny@gmail.com", password_digest: "password", is_ken: false)
      session[:user_id] = @user.id
      @category = Category.create!(name: "Dessert")
      @recipe = Recipe.create!(title: "Banana Bread", category_id: @category.id, user_id: 1, time: 60, difficulty: "Easy", directions: "Mix ingredients. Bake at 350 degrees for 50 minutes.")

      put :update, category_id: @category.id, id: @recipe.id
      # expect(response).to have_http_status(:success)
    end
  end

end
