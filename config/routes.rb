Rails.application.routes.draw do
  get "users/show"
  get "users/edit"
  get "users/update"
  get "home/index"
  devise_for :users
  get "todos/completed", to: "todos#completed"
  resources :todos
  resources :categories
  root "home#index"
  resource :account, controller: "users", only: [ :show, :edit, :update ]

  get "account/verify_password", to: "users#verify_password"
  post "account/check_password", to: "users#check_password"
  get "account/change_password", to: "users#change_password"
  patch "account/update_password", to: "users#update_password"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
