# frozen_string_literal: true
# :nodoc:
class RecipeSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :user,
             :instructions,
             :summary,
             :original_gravity,
             :final_gravity,
             :abv,
             :ibu,
             :srm,
             :image_url

  has_many :recipe_ingredients, key: 'ingredients'

  def user
    object.user.id
  end
end
