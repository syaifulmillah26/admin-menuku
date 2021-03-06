# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)", locale: /en|id/ do
    namespace :api do
      resources :companies
      resources :outlets
      resources :business_types

      resources :provinces, only: %i[index]
      resources :cities, only: %i[index]
      resources :subdistricts, only: %i[index]

      resources :roles
      resources :users do
        collection do
          get :profile
          post :email_confirmation
          post :forgot_password
          post :set_new_password
        end
      end
      post '/auth/signin', to: 'user_token#create'
      post '/auth/signup', to: 'users#create'
      resources :profile, only: %i[index] do
        collection do
          put :update_profile
          put :update_password
        end
      end
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
