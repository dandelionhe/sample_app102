Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get '/home',to: 'static_pages#Home'

  get '/help', to:'static_pages#Help'

  get '/about', to:'static_pages#About'

  get '/signup', to:'users#new'

  get '/login',to:'sessions#new'

  post '/login',to:'sessions#create'

  delete '/logout',to:'sessions#destroy'

  resources :users

  root 'static_pages#Home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
