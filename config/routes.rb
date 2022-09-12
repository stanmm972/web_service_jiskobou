Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  scope "admin" do
    get "users", to: "users#index"
    get "users/:id", to: "users#show", as: "user"
    delete "users/:id", to: "users#destroy"
  end
  resources :users do
    resources :messages
  end
  root 'pages#home'
end
