Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get '/', to: 'home#index'

      scope :accounts do
        get '/:id/balance', to: 'accounts#balance'
        patch '/:id/transfer', to: 'accounts#transfer'
        get '/:id', to: 'accounts#show'
        get '/', to: 'accounts#index'
        post '/', to: 'accounts#create'
        patch '/:id', to: 'accounts#update'
      end

      scope :customers do
        get '/:id/accounts', to: 'customers#accounts'
        get '/:id', to: 'customers#show'
        get '/', to: 'customers#index'
        post '/', to: 'customers#create'
        patch '/:id', to: 'customers#update'
      end
    end
  end
end
