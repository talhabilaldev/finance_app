Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users
  root 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end
