Rails.application.routes.draw do
  get 'user/show'
  root :to => "home#index"
  
  get '/static_pages/team', to: 'static_pages#team'

  get '/static_pages/contact', to: 'static_pages#contact'

  resources :gossips

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
