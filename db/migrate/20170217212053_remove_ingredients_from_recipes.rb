# frozen_string_literal: true
class RemoveIngredientsFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :ingredients, :text
  end
end
