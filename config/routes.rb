Rails.application.routes.draw do
  resources :pdfs
  
  # resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  root 'static_pages#home'
  get '/about' => 'static_pages#about'
end
