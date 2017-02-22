# frozen_string_literal: true
# :nodoc:
class RecipesController < ProtectedController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = current_user.recipes.all

    render json: @recipes
  end

  # GET /recipes/:id
  def show
    if @recipe
      render json: @recipe
    else
      head status: :not_found
    end
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params)

    build_recipe_ingredients

    if @recipe.save!
      render json: @recipe, status: :created
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/:id
  def update
    Recipe.transaction do
      @recipe.ingredients.destroy_all
      @recipe.assign_attributes(recipe_params)
      build_recipe_ingredients
    end

    if @recipe.save!
      head :no_content
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  # Build ingredients from params and relationships to recipes
  def build_recipe_ingredients
    @recipe.recipe_ingredients.each do |recipe_ingredient|
      recipe_ingredient
        .ingredient = Ingredient.find_or_create_by(name: recipe_ingredient
                                                           .ingredient.name
                                                           .downcase,
                                                   unit: recipe_ingredient
                                                           .ingredient.unit
                                                           .downcase)
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

  private :set_recipe, :recipe_params, :build_recipe_ingredients
end
