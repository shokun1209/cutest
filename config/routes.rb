Rails.application.routes.draw do
  root to: 'photos#index'
  resources :photos
  post '/callback' => 'webhook#callback'
end

