Rails.application.routes.draw do
  devise_for :users
  resources :thoughts
  resources :users, only: [:index, :show]
  resources :follows, only: [:create, :destroy]
  resources :likes, only: %i[create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'thoughts#index'
end
