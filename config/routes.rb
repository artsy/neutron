Rails.application.routes.draw do
  resources :articles, only: [:index, :edit, :new, :create]
  # root "home#index"
end
