Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :user_friendships, only: [:create, :destroy]
  devise_for :users
  root 'pages#index'
  get 'my_friends', to: 'users#my_friends'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'friendships#search'
end
