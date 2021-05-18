Rails.application.routes.draw do
  root "welcome#index"
  get '/welcome', to: 'welcome#index'
  namespace :api, defaults: { format: :json } do
    resources :books, only: [:index, :create, :destroy]
  end
end
