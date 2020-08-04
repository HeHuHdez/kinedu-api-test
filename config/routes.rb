Rails.application.routes.draw do
  namespace :api do
    mount Rswag::Api::Engine => '/api-docs'
    mount Rswag::Ui::Engine => '/api-docs'
    resources :sessions, only: :create
  end
end
