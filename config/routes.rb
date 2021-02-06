Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dragons, except: :destroy do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update]


  resources :profiles, only: [:show]


end
