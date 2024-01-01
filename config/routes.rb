Rails.application.routes.draw do
  get 'sessions/new'
  # get 'static_pages/home'
  # get 'static_pages/help'
  get 'help', to: "static_pages#help"  # , as: "helf"
  # get 'static_pages/about'
  get 'about', to: 'static_pages#about'
  # get 'static_pages/contract'
  get 'contract', to: 'static_pages#contract'

  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/login', to: "sessions#destory"

  resources :microposts
  # 符合 RESTFul  风格
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root 'users#index'
  root 'static_pages#home'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
