Rails.application.routes.draw do
	# this is for admin only
  devise_for :admin_users, ActiveAdmin::Devise.config

  #  for other users user 'user' model
  mount_devise_token_auth_for 'User', at: 'v1/auth', controllers: {
    registrations: 'overrides/registrations'
  }

  root to: 'admin/dashboard#index'

  ActiveAdmin.routes(self)

  namespace :v1 do
    resources :tiers, only: [:index]
    resources :horses
    resources :states, only: [:index]
  end
end
