Rails.application.routes.draw do
  namespace :v1 do
    resources :clients, only: [] do
      resources :transactions, only: [:index]
      get 'account-balance', to: 'clients#account_balance'
    end
  end
end
