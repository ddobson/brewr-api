# frozen_string_literal: true
# :nodoc:
class RecipeIngredientSerializer < ActiveModel::Serializer
  type :ingredient

  attributes :id, :quantity

  attribute :name do
    object.ingredient.name.split.map(&:capitalize).join(' ')
  end

  attribute :unit do
    object.ingredient.unit
  end

  def id
    object.ingredient.id
  end
end
