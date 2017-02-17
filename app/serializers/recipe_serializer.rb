# frozen_string_literal: true
# :nodoc:
class RecipeSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :user,
             :instructions,
             :ingredients,
             :summary,
             :original_gravity,
             :final_gravity,
             :abv,
             :ibu,
             :srm

  def user
    object.user.id
  end
end
