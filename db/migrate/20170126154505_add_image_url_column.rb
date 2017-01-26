class AddImageUrlColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :image_url, :string, :default => 'http://i.imgur.com/VDI7NXx.jpg'
  end
end
