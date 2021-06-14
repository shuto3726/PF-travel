Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :tags do
    get 'posts', to: 'posts#search'
  end
  
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
