Rails.application.routes.draw do

  # Rota pwa 
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  
  get "errors/not_found"
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

  # Rota "Catch-all" para 404 - DEVE SER A ÚLTIMA LINHA
  match "*unmatched", to: "errors#not_found", via: :all

end