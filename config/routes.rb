Rails.application.routes.draw do
  root to: 'photos#index'
  resources :photos, only: [:index, :photo, :video, :show, :destroy] do
    resources :messages, only: [:create,:destroy]
  end
  get '/photo', to: "photos#photo"
  get '/video', to: "photos#video"
  get '/photo/search', to: "photos#photo_search"
  get '/video/search', to: "photos#video_search"
  post '/callback' => 'webhook#callback'

end

