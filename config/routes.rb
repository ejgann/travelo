Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home', as: 'home'

  #presents signup form
  get '/signup', to: 'users#new', as: '/signup'
  get '/user', to: 'users#index' 
  get '/users', to: 'users#index' 
  #creates user with validation
  post '/user', to: 'users#create'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to:'users#edit', as: 'edit_user'
  # resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  patch 'users/:id', to: 'users#update', as: 'update'
  post '/delete', to: 'users#destroy', as: 'delete'

  get '/posts/new', to: 'posts#new', as: 'welcome'
  post '/posts', to: 'posts#create'
  get '/posts', to: 'posts#index', as: 'index'
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  patch '/posts/:id', to: 'posts#update', as: 'posts_update'

  resources :locations
  resources :comments
 
  #presents a login form
  get '/login', to: 'session#new', as: 'login'
  #creates session from form_tag and redirect 
  # post '/login' => 'session#create'
  post '/session', to: 'session#create'
  get '/session', to: 'session#new'

 
  # post '/logout', to: 'session#destroy', as: 'logout'
  get '/logout', to: 'session#destroy', as: 'logout'
  get '/auth/facebook/callback' => 'facebooksessions#create'
end
