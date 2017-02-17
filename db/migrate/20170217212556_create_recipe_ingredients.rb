# frozen_string_literal: true
class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.decimal :quantity
      t.references :recipe, index: true, null: false, foreign_key: true
      t.references :ingredient, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
