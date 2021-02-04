Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dragons, except: :destroy do
    resources :bookings, only: [:new, :create, :edit, :update]
  end

  resources :profiles, only: [:show]

  resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
