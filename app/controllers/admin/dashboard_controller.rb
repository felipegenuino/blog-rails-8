# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
  # 1. Garante que o Current.user seja carregado
  before_action :resume_session
  
  # 2. Bloqueia quem não for Admin
  before_action :ensure_admin!

  def index
    @posts_count = Post.count
    @recent_posts = Post.order(created_at: :desc).limit(10)
    
    # Métricas Ahoy
    @total_views = Ahoy::Event.where(name: "Viewed Post").count
    @daily_views = Ahoy::Event.where(name: "Viewed Post").group_by_day(:time, last: 7).count

    # Lógica de extração de IDs para SQLite
    raw_properties = Ahoy::Event.where(name: "Viewed Post").pluck(:properties)
    @views_by_post = parse_post_ids(raw_properties).tally
  end

  private

  def ensure_admin!
    # Se não estiver logado OU não for admin, volta para a home
    unless authenticated? && Current.user.admin?
      redirect_to root_path, alert: "Acesso restrito: Você não tem permissão para acessar esta área."
    end
  end

  def parse_post_ids(properties)
    properties.map do |prop|
      data = if prop.is_a?(String)
               begin
                 JSON.parse(prop)
               rescue JSON::ParserError
                 YAML.safe_load(prop.gsub(':', '"').gsub('=>', '":')) rescue {}
               end
             else
               prop
             end
      data["post_id"] || data[:post_id]
    end.compact.map(&:to_i)
  end
end