Rails.application.routes.draw do
  root "welcome#home"
  get '/signup', to: 'users#new', as: 'signup'
  get '/login' => 'sessions#new', as: 'login'
  post '/sessions' => 'sessions#create', as: 'sessions'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  # get '/recipes/search_three', to: "recipes#search_three", as: 'search_three'
  get '/recipes/search_three', to: "recipes#new_for_three_ingr", as: 'recipe_suggestion'
  post '/recipes/search_three', to: "recipes#create_with_ingredients", as: 'triple_search'

  # get '/recipes/search_keyword', to: "recipes#search_keyword", as: 'search_keyword'
  # post '/recipes/search_three', to: "recipes#create", as: 'recipe_suggestion'
  # get '/recipes/new', to: 'recipes#new', as: 'search'
  # post '/recipes', to: 'recipes#create', as: 'suggestion'
  resources :users
  resources :user_recipes
  resources :recipes, only: [ :new, :show, :create, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
