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
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
