Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :posts, only: %i[index show]

  namespace :admin do
    resources :posts, only: %i[create new edit update destroy]
  end
end
