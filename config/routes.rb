Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dragons, only: %i[:index :create :new :update :edit :show] 
  resources :bookings,  only: %i[:index :create :new :update :edit :show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
