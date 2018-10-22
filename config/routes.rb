Rails.application.routes.draw do
  root "welcome#home"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :user_recipes
  resources :recipes
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
