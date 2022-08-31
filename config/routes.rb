Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  resources :users do
    resources :messages
  end
  root 'pages#home'
end
