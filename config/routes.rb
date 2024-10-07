Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :guests, only: [:show] # For displaying individual guest invites

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'invite/:token', to: 'guests#show', as: 'invite'

  # Defines the root path route ("/")
  # root "posts#index"
end
