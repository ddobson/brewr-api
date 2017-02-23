# frozen_string_literal: true
# :nodoc:
class RecipeIngredientSerializer < ActiveModel::Serializer
  type :ingredient

  attributes :id, :quantity, :name, :unit

  def name
    object.ingredient.name.split.map(&:capitalize).join(' ')
  end

  def unit
    object.ingredient.unit
  end

  def id
    object.ingredient.id
  end
end
