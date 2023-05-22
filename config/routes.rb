Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :users
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
