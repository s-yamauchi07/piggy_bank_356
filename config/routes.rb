Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }
  
    namespace :auth do
      resources :sessions, only: [:index]
    end
  end
  resources :amounts, only: [:index, :create]
  resources :calendars, only: [:index]
end

