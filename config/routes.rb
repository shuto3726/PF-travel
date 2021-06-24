Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  
  resources :posts do
    collection do
      get 'index_by_prefecture'
    end
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  
  get '/map_request', to: 'maps#map', as: 'map_request'
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get :favorites
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
