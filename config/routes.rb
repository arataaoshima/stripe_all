Rails.application.routes.draw do
  resources :posts
  devise_for :users
  post "/unsubscribe" =>"charges#unsubscribe"
  get 'home/top'
  root to: "home#index"
  resources :charges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
