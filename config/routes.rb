Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :edit, :update, :destroy]
  root "home#top"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "/signup", to: "users#new"

  get "home/top"
  get "home/about"
  resources :posts do
    resources :comments, only: [:create, :new]
  end
  resources :users
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  resources :tests

  mount Graphql::Voyager::Rails::Engine, at: "/graphql-voyager", graphql_path: "/graphql"
end
