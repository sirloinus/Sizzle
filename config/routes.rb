Rails.application.routes.draw do
  root "welcome#home"
  get '/signup', to: 'users#new', as: 'signup'
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy', as: 'logout'
  resources :users, only: [:index, :show, :create, :edit, :destroy]
  resources :user_recipes
  resources :recipes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
