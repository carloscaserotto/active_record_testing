Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  resources :categories
  resources :users
  get "search_users", to: 'users#search'
end
