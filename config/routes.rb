Rails.application.routes.draw do
  root to: 'plants#index'
  resources :plants
  resources :users
  resource :sessions
  
  get 'users/new'
  get 'sessions/login'

  get :Signup, :to => 'users#new'
  post :Signup, :to => 'sessions#login'
  get :Login, :to => 'sessions#login'
  post :Login, :to => 'plants#index'
  get :Logout, :to => 'sessions#logout'
  post :Logout, :to => 'plants#index'

end
