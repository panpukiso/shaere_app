Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root 'static_pages#home'
  get '/about' => 'static_pages#about'
end
