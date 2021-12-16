Rails.application.routes.draw do
  get 'projects/matches'
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :matches, only: %I[create destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
