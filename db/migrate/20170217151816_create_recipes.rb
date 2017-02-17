# frozen_string_literal: true
# create recipe table
class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.references :user, index: true, null: false, foreign_key: true
      t.text :instructions, null: false
      t.text :ingredients, null: false
      t.text :summary
      t.decimal :original_gravity
      t.decimal :final_gravity
      t.decimal :abv
      t.integer :ibu
      t.integer :srm

      t.timestamps null: false
    end
  end
end
