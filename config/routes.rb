Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  resources :messages
  root 'pages#home'
end
