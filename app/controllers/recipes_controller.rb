# frozen_string_literal: true
# :nodoc:
class RecipesController < OpenReadController
  before_action :set_recipe, only: [:update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all

    render json: @recipes
  end

  # GET /recipes/1
  def show
    render json: Recipe.find(params[:id])
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params)
    # @recipe.recipe_ingredients
    #        .build
    #        .build_ingredient

    build_recipe_ingredients

    if @recipe.save!
      render json: @recipe, status: :created
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      head :no_content
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  def build_recipe_ingredients
    @recipe.recipe_ingredients.each do |recipe_ingredient|
      recipe_ingredient
        .ingredient = Ingredient.find_or_create_by(name: recipe_ingredient.ingredient.name) do |ingredient|
          ingredient.unit = recipe_ingredient.ingredient.unit
        end
    end
  end

  # Only allow a trusted parameter "white list" through.
  def recipe_params
    params.require(:recipe)
          .permit(:name,
                  :instructions,
                  :summary,
                  :original_gravity,
                  :final_gravity,
                  :abv,
                  :ibu,
                  :srm,
                  :image_url,
                  recipe_ingredients_attributes: [:quantity,
                                                  ingredient_attributes: [
                                                    :name,
                                                    :unit
                                                  ]])
  end

  private :set_recipe, :recipe_params
end
