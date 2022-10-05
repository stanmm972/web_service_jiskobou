Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  scope "admin" do
    get "users", to: "users#index"
    get "users/:id", to: "users#show", as: "user"
    delete "users/:id", to: "users#destroy"
    patch "users/:id", to: "users#update"
  end
  resources :users do
    resources :messages
    member do
      get 'calendar'
    end
  end
  root 'pages#home'
end
