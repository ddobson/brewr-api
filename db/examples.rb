# frozen_string_literal: true
1.times do
  @user = User.find_by(email: 'example_data@brewr.com')
  next if @user
  User.create!(email: 'example_data@brewr.com',
               password: 'pass',
               password_confirmation: 'pass')
end

%w(IPA Lager Stout Porter Ale).each do |name|
  summary = 'It\'s a beer. Lorem ipsum dolor sit amet, consectetur adipiscing
             elit, sed do eiusmod tempor incididunt ut labore et dolore magna
             aliqua. Ut enim ad minim veniam, quis nosrud exercitation ullamco.'

  recipe_params = {
    name: "Amazing #{name}",
    user_id: User.first.id,
    instructions: 'make beer',
    summary: summary.strip,
    original_gravity: 1.011,
    final_gravity: 1.049,
    abv: 5.2,
    ibu: 19,
    srm: 30,
    image_url: 'http://i.imgur.com/PKDP9QO.jpg'
  }

  next if Recipe.exists?(name: name)
  Recipe.create! recipe_params
end

units = %w(tsb tsp gal oz lbs)

%w(water hops malt grain yeast sugar).each do |ingredient|
  next if Ingredient.find_by(name: ingredient)
  Ingredient.create(name: ingredient, unit: units.sample)
end

Recipe.all.each do |recipe|
  next unless recipe.ingredients.empty?
  Ingredient.all.each do |ingredient|
    RecipeIngredient.create(recipe: recipe,
                            ingredient: ingredient,
                            quantity: 10)
  end
end
