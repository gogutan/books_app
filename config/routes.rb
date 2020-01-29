# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "books#index"
  scope "(:locale)" do
    resources :books
    resources :users, only: [:show] do
      resource :following, only: [:show], controller: "users/following"
      resource :followers, only: [:show], controller: "users/followers"
    end
    resources :relationships, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
