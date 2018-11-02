Rails.application.routes.draw do
  #devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :v1 do
    resources :sessions, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
