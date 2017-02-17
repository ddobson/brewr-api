require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe RecipesController, type: :controller do
  def user_params
    {
      email: 'beer@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def recipe_params
    {
      name: 'Kick ass stout',
      user_id: user.id,
      instructions: 'make beer',
      ingredients: 'water and some other stuff',
      summary: 'it\'s a beer',
      original_gravity: 1.014,
      final_gravity: 1.103,
      abv: 4.9,
      ibu: 18,
      srm: 39
    }
  end

  def user
    User.first
  end

  def recipe
    Recipe.first
  end

  before(:all) do
    User.create! user_params
  end

  before(:all) do
    Recipe.create! recipe_params
  end

  after(:all) do
    User.destroy_all
  end

  # after(:all) do
  #   Recipe.destroy_all
  # end

  ### BEGIN TEST DEFINITIONS ###

  context 'when not authenticated' do
    describe 'GET #index' do
      before(:each) do
        get :index
      end

      it 'is a successful request' do
        expect(response.status).to eq(200)
        expect(response).to be_successful
      end

      it 'fetches a collection of recipes' do
        recipes_response = JSON.parse response.body
        expect(recipes_response.length).to eq(Recipe.all.length)
        expect(recipes_response['recipes'].first['name']).to eq(recipe.name)
      end
    end

    describe 'GET show' do
      before(:each) { get :show, id: recipe.id }

      it 'is successful' do
        expect(response.status).to eq(200)
      end

      it 'renders a JSON response' do
        recipe_response = JSON.parse(response.body)
        expect(recipe_response).not_to be_nil
      end

      it 'has the correct content' do
        recipe_response = JSON.parse(response.body)
        expect(recipe_response['recipe']['id']).to eq(recipe.id)
        expect(recipe_response['recipe']['name']).to eq(recipe.name)
      end
    end

    describe 'POST create' do
      def new_recipe
        {
          name: 'World changing ale',
          user_id: user.id,
          instructions: 'make beer',
          ingredients: 'water and some other stuff',
          summary: 'it\'s a beer',
          original_gravity: 1.014,
          final_gravity: 1.103,
          abv: 5.9,
          ibu: 40,
          srm: 29
        }
      end

      before(:each) do
        post :create, params: { recipe: new_recipe }, format: :json
      end

      it 'is not successful' do
        expect(response).not_to be_successful
      end

      it 'cites that authentication is required' do
        expect(response.body.strip).to eq('HTTP Token: Access denied.')
      end
    end
  end
end
