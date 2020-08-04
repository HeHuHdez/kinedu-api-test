# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    mount Rswag::Api::Engine => '/api-docs'
    mount Rswag::Ui::Engine => '/api-docs'
    resources :sessions, only: :create

    resources :babies, only: :index do
      get :activity_logs, on: :member
    end

    resources :activities, only: :index

    resources :activity_logs, only: %i[create update destroy]
  end
end
