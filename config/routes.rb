Rails.application.routes.draw do
  root to: 'photos#index'
  resources :photos, only: :index
  resources :gallerys, only: [:index, :show, :destroy]
  resources :videos, only: [:index, :show, :destroy]
  get '/photo/search', to: "gallerys#search"
  get '/video/search', to: "videos#search"
  post '/callback' => 'webhook#callback'
end

