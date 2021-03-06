# frozen_string_literal: true
# :add an image url to recipes:
class AddImageToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :image_url, :string
  end
end
