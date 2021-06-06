Rails.application.routes.draw do
  resources :posts
  root to: 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  #sessionコントローラーに新しいアクション
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

end
