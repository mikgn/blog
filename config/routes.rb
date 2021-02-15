Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  root to: 'posts#index'
  resources :users, only: %i[show edit update]
  resources :posts do
    resources :comments, only: %i[create edit update destroy]
  end
  resources :tags, param: :name
end
