Rails.application.routes.draw do
  resources :articles, only: [:index, :edit, :new, :create, :update, :destroy]
  # root "home#index"
end
