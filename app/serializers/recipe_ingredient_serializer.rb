# frozen_string_literal: true
# :nodoc:
class RecipeIngredientSerializer < ActiveModel::Serializer
  type :ingredient

  attributes :id, :quantity

  attribute :name do
    object.ingredient.name.capitalize
  end

  attribute :unit do
    object.ingredient.unit.capitalize
  end

  def id
    object.ingredient.id
  end
end
