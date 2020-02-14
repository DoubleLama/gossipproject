Rails.application.routes.draw do

  root 'gossips#index'

  get '/static_pages/team', to: 'static_pages#team'

  get '/static_pages/contact', to: 'static_pages#contact'

  resources :gossips

  resources :cities

  resources :users
  
  resources :sessions, only:[:new, :create, :destroy]
  
end
