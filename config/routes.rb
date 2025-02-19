Rails.application.routes.draw do
  # Authentication
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resource :session
  resources :passwords, param: :token

  concern :fetchable do
    collection do
      get :fetch
    end
  end

  resources :chat_messages
  resources :form_templates
  resource :dispatch
  resources :drivers, concerns: :fetchable
  resources :form_submissions
  resources :kafka_messages, only: [:index]
  resources :locations, concerns: :fetchable
  resources :orders
  resources :routes, concerns: :fetchable do
    resources :stops
    resources :order_stops, only: [:create]
  end
  resources :trailers, concerns: :fetchable
  resources :vehicles, concerns: :fetchable
  resources :webhooks, only: [:create, :index]

  # OAuth connection to Samsara
  get "/auth/samsara", to: "auths#samsara"
  get "/auth/samsara/callback", to: "auths#samsara_callback"
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "static_pages#root"
end
