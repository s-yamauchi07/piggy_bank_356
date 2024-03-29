Rails.application.routes.draw do
  root to: 'homes#index'
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }
  
    namespace :auth do
      resources :sessions, only: [:index]
    end
  end
  resources :amounts, only: [:index, :create, :destroy]
  resources :calendars, only: [:index]
  resources :users, only: [:show]
end

