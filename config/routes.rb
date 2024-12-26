Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "users/registrations#create"
        post "sign_in", to: "users/sessions#create"
        delete "sign_out", to: "users/sessions#sign_out"
      end
      resources :projects do
        resources :deliverables
        resources :user_projects, only: [:index, :create, :destroy]
      end
      resources :companies do
        resources :projects, only: [:index]
      end

      resources :users do
        resources :roles, only: [:index] # Fetch roles assigned to a user
        resources :permissions, only: [:index] # Fetch permissions assigned to a user
      end

      resources :user_projects
      resources :images # Polymorphic association for handling images
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
