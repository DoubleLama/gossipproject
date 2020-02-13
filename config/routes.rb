Rails.application.routes.draw do
  get '/static_pages/team', to: 'static_pages#team'

  get '/static_pages/contact', to: 'static_pages#contact'

  resources :gossips

  resources :cities

  resources :users
  
  resources :sessions, only:[:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
