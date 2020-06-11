Rails.application.routes.draw do
  
  root to: 'plants#index'
  
  resources :plants, only: [:index, :show, :edit]
  resources :users
  resource :sessions
  resources :cart
  
  get 'cart/show'
  get 'cart/index'
  get 'cart/new'
  get 'cart/edit'
  get 'cart/destroy'
  get 'cart/add'
  post 'cart/add'

  get 'users/new'
  get 'sessions/login'

  get :Signup, :to => 'users#new'
  post :Signup, :to => 'sessions#login'
  get :Login, :to => 'sessions#login'
  post "login_attempt", :to => "sessions#login_attempt"

  post "sessions/login", :to => "plants#index"

  post :Login, :to => 'plants#index'
  get :Logout, :to => 'sessions#logout'
  post :Logout, :to => 'plants#index'

end
