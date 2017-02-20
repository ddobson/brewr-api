# frozen_string_literal: true
Rails.application.routes.draw do
  resources :recipes, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  get '/user_recipes' => 'recipes#user_recipes'
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
