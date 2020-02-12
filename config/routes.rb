# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "books#index"
  scope "(:locale)" do
    namespace :books do
      resources :timeline, only: [:index]
    end
    resources :books
    resources :users, only: [:show] do
      resource :following, only: [:show], controller: "users/following"
      resource :followers, only: [:show], controller: "users/followers"
      resource :reports, only: [:show], controller: "users/reports"
    end
    resources :relationships, only: [:create, :destroy]
    resources :reports
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
