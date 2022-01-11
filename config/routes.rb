Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/api/graphql"
  end
  post "/api/graphql", to: "graphql#execute"
  resources :articles, only: [:index, :edit, :new, :create, :update, :destroy]
  # root "home#index"
end
