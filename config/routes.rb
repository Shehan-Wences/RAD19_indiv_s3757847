Rails.application.routes.draw do


  get 'locations/new'

  get 'categories/new'

  get 'category/new'

  resources :courses
  get 'courses/new'

  get 'sessions/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/catcreate',  to: 'categories#new'
  post '/catcreate',  to: 'categories#create'
   get  '/locationcreate',  to: 'locations#new'
  post '/locationcreate',  to: 'locations#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
end
