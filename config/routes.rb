Rails.application.routes.draw do


  get 'vote/create'

  get 'vote/destroy'

  get 'locations/new'
  get 'categories/new'
  get 'category/new'
  get 'courses/new'
  get 'sessions/new'
  root 'static_pages#home'
  get  '/contact',    to: 'static_pages#contact'
  post  '/contact',    to: 'static_pages#create'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/catcreate',  to: 'categories#new'
  post '/catcreate',  to: 'categories#create'
  get  '/locationcreate',  to: 'locations#new'
  post '/locationcreate',  to: 'locations#create'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  post '/createcourse',   to: 'courses#create'
  post '/updatecourse',   to: 'courses#update'
  delete '/logout',  to: 'sessions#destroy'



  resources :courses do
  resources :vote, only: [:create, :update]
  end
  resources :courses
  resources :users

end
