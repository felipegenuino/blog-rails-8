Rails.application.routes.draw do
  # 1. Removido o 'resources :comments' que estava aqui no topo sozinho.

  # Rotas Administrativas
  namespace :admin do
    get "dashboard", to: "dashboard#index"
    root to: "dashboard#index"
  end
  
  # Autenticação Nativa Rails 8
  resource :session
  resources :passwords, param: :token
 
  # Posts e seus Comentários Aninhados
  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end

  # Health Check e Root
  get "up" => "rails/health#show", as: :rails_health_check
  root "posts#index"

  # OmniAuth / Login Social
  get "auth/:provider/callback", to: "omniauth_callbacks#github"
  get "auth/failure", to: redirect("/login")
end