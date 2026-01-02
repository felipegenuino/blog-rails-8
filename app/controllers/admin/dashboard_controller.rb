class Admin::DashboardController < ApplicationController
  before_action :require_authentication

  def index
    # Usamos variáveis de instância para as estatísticas que criamos nos cards
    @posts_count = Post.count
    
    # É importante usar o limit(5) para não sobrecarregar a página inicial do admin
    @recent_posts = Post.order(created_at: :desc).limit(10) 
  end
end