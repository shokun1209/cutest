Rails.application.routes.draw do
  root to: 'photos#index'
  post '/callback' => 'webhook#callback'
end

