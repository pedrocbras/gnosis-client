Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :articles, only: [:index], constraints: { format: 'json' }
    end
  end
end
