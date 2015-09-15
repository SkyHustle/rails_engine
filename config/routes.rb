Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "merchants/find", to: "merchants#find"
      resources :merchants, only: [:show]

      resources :customers, only: [:show]

      resources :invoices, only: [:show]

      resources :invoice_items, only: [:show]

      get "transactions/find", to: "transactions#find"
      resources :transactions, only: [:show]

      resources :items, only: [:show]
    end
  end
end
