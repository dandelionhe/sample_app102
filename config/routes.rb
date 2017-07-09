Rails.application.routes.draw do
  get 'users/new'

  get '/home',to: 'static_pages#Home'

  get '/help', to:'static_pages#Help'

  get '/about', to:'static_pages#About'

  get '/signup', to:'users#new'

  resources :users

  root 'static_pages#Home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
