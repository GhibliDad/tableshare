Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events, except: [:destroy] do
  #   resources :reservations, only: [:new, :create]
  #   resources :chatrooms, only: [:create]
  end
  # resources :reservations, only: [:show, :edit, :update]

  resources :users, only: [:show, :edit, :update]
  # route for user show page
  # get "users/:id", to: "users#show", as: :user
  # get "users/:id/edit", to: "users#edit", as: :edit_user
  # patch "users/:id", to: "users#update"
end
