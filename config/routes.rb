Rails.application.routes.draw do
  get 'winners/index'
  root to: 'pages#home'

  devise_for :users
  resources :users, param: :username do
    resources :guesses, only: [:index, :new, :create]
  end

  resources :treasures, only: [:index, :show] do
    resources :guesses, only: [:create]
  end
  
  resources :winners, only: [:index]

  get "up" => "rails/health#show", as: :rails_health_check
end
