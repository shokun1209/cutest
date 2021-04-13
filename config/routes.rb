Rails.application.routes.draw do
  root to: 'photos#index'
  resources :photos, only: [:index]
  post '/callback' => 'webhook#callback'
end

