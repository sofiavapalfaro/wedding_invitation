Rails.application.routes.draw do
  get 'profile/show'
  # Devise routes for admin authentication
  devise_for :admins
  # Profile route for admins
  # Profile routes for admins (edit and update)
  resource :profile, only: [:show, :edit, :update], controller: 'profiles'
  # Set the root path to the HomeController's index action
  root "home#index"

  # Guest invitation route
  get 'invite/:token', to: 'guests#show', as: 'invite'

  # RSVP actions for guests
  resources :guests, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    member do
      patch :rsvp  # RSVP action will use token parameter
    end
  end

  # Protect routes for admin management (guests creation, editing, etc.)
  authenticate :admin do
    resources :guests, only: [:index, :new, :create, :edit, :update, :destroy] # Admin can manage guests
  end

  # Define routes for each of the new sections
  get 'us_through_time_in_pictures', to: 'home#us_through_time_in_pictures', as: 'us_through_time_in_pictures'
  get 'our_story', to: 'home#our_story', as: 'our_story'
  get 'events', to: 'home#events', as: 'events'
  get 'accommodations', to: 'home#accommodations', as: 'accommodations'
  get 'attractions', to: 'home#attractions', as: 'attractions'
  get 'hairdressers', to: 'home#hairdressers', as: 'hairdressers'
  get 'restaurant', to: 'home#restaurant', as: 'restaurant'
  get 'rsvp', to: 'home#rsvp', as: 'rsvp'
  get 'registry', to: 'home#registry', as: 'registry'
end
