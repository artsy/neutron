Rails.application.routes.draw do
  resources :articles, only: [:index, :edit]
  # root "home#index"
end
