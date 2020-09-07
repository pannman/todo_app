Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/addtodo', to: 'todos#new'
  post '/addtodo', to: 'todos#create'
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :todos,          only: [:new,:create,:edit, :update,:destroy]
end
