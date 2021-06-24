Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  post '/home/guest_sign_in', to: 'homes#new_guest'
  
  
  resources :posts do
    collection do
      get 'index_by_prefecture'
    end
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  
  get '/map_request', to: 'maps#map', as: 'map_request'
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get :favorites
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
