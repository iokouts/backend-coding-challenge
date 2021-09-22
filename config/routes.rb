Rails.application.routes.draw do
  # API
  # TODO: add routes
  namespace :api do
    namespace :v1 do
      resources :airports, only: [:index]
    end
  end

  # Delegate to Vue
  root 'vue#index'
  match '*path', to: 'vue#index', format: false, via: :get, constraints: lambda { |req|
    req.path.exclude?('rails/active_storage')
  }
end
