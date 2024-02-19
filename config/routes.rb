Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :shelves
  resources :books
  resources :notes
  resources :friends
  resources :groups
  resources :group_members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end