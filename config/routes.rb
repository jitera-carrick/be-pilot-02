require 'sidekiq/web'
Rails.application.routes.draw do
  resources :kais
  resources :tryns
  resources :books
  resources :schools
  resources :products
  resources :stores
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get '/health' => 'pages#health_check'
  get 'api-docs/v1/swagger.yaml' => 'swagger#yaml'
  # ... other routes ...
  post '/login', to: 'tokens#login'
  delete '/logout', to: 'base#logout_user'
end