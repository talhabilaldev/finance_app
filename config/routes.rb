Rails.application.routes.draw do
  devise_for :users
  root 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end
