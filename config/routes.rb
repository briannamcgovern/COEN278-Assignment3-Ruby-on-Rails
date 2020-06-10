Rails.application.routes.draw do
#  get 'plants/index'
  root to: 'plants#index'
#  resources :products

  resources :plants

#  get '/'
#  get 'home/'
  get 'home/page1'
  get 'home/page2'
end
