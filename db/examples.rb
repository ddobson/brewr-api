# frozen_string_literal: true
1.times do
  @user = User.find_by(email: 'example_data@brewr.com')
  next if @user
  User.create!(email: 'example_data@brewr.com',
               password: 'pass',
               password_confirmation: 'pass')
end

%w(IPA Lager Stout Porter Ale).each do |name|
  recipe_params = {
    name: name,
    user_id: User.first.id,
    instructions: 'make beer',
    summary: 'it\'s a beer',
    original_gravity: 1.011,
    final_gravity: 1.049,
    abv: 5.2,
    ibu: 19,
    srm: 30
  }

  next if Recipe.exists?(name: name)
  Recipe.create! recipe_params
end

%w(water hops malt grain yeast sugar).each do |ingredient|
  next if Ingredient.find_by(name: ingredient)
  Ingredient.create(name: ingredient, unit: 'some unit')
end

Recipe.all.each do |recipe|
  next unless recipe.ingredients.empty?
  Ingredient.all.each do |ingredient|
    RecipeIngredient.create(recipe: recipe,
                            ingredient: ingredient,
                            quantity: 10)
  end
end
