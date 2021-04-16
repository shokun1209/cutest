Rails.application.routes.draw do
  root to: 'photos#index'
  resources :photos, only: :index
  resources :gallerys 
  resources :videos
  post '/callback' => 'webhook#callback'
end

