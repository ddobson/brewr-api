# frozen_string_literal: true
# :nodoc
class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, presence: true
  validates :ingredient, presence: true

  accepts_nested_attributes_for :ingredient
end
