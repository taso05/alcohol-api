Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/users', to: 'users#index'
  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create'
  delete '/recipes/:id', to: 'recipes#destroy'
  put '/recipes/:id', to: 'recipes#update'
end
