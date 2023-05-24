Rails.application.routes.draw do
  devise_for :users
  resources :recipe_foods
  resources :recipes
  resources :users
  resources :foods
  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
  get '/add_food', to: 'recipes#add_food', as: 'add_food'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
end
