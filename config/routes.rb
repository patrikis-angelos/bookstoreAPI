Rails.application.routes.draw do
  root "welcome#index"
  get '/welcome', to: 'welcome#index'
  resources :books, only: [:index, :create, :destroy]
end
