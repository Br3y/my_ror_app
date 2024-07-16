Rails.application.routes.draw do
  resources :cars, except: [:destroy]
  # resources :cars, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # The Rails way to write RESTful routes
  resources :posts
  
  # Long way to write RESTful routes
  # get "/posts", to: "posts#index"
  # get "/posts/new", to: "posts#new"
  # get "/posts/:id", to: "posts#show"
  # post "/posts", to: "posts#create"
  # get "/posts/:id/edit", to: "posts#edit"
  # put "/posts/:id", to: "posts#update"
  # delete "/posts/:id", to: "posts#destroy" 

  resources :brands, only: [:index, :show] do 
    resources :products, only: [:index, :show]
  end

  resources :basket, only: [:show, :update, :destroy]

  resolve("Basket") { route_for(:basket) }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
