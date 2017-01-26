class AddIndexRaitingsRecipeId < ActiveRecord::Migration[5.0]
  def change
    add_index(:ratings, :recipe_id)
  end
end
