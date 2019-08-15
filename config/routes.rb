Rails.application.routes.draw do
  # mount_devise_token_auth_for 'Uni', at: 'auth'
  namespace :api do
    namespace :v0 do
      resources :articles, only: [:index]
    end
  end
end
