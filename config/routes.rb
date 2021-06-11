Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'
  devise_for :users
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :tags do
    get 'posts', to: 'posts#search'
  end
  
  resources :users, only: [:show, :edit, :update, :destroy]

end
