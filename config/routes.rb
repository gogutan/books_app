# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  scope "(:locale)" do
    resources :books
    resources :users, only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
