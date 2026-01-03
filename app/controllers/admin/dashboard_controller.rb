class Admin::DashboardController < ApplicationController
  before_action :require_authentication


  # app/controllers/admin/dashboard_controller.rb
# app/controllers/admin/dashboard_controller.rb
def index
  @posts_count = Post.count
  @recent_posts = Post.order(created_at: :desc).limit(10)
  @total_views = Ahoy::Event.where(name: "Viewed Post").count

  raw_properties = Ahoy::Event.where(name: "Viewed Post").pluck(:properties)

  post_ids = raw_properties.map do |prop|
    # Se for String, tentamos converter. Se falhar o JSON, usamos eval ou YAML
    data = if prop.is_a?(String)
             begin
               JSON.parse(prop)
             rescue JSON::ParserError
               # Se o SQLite guardou como Hash Ruby serializado (o seu caso!)
               # O YAML.safe_load resolve essa sintaxe de símbolos
               YAML.safe_load(prop.gsub(':', '"').gsub('=>', '":')) rescue {}
             end
           else
             prop
           end
    
    # Busca pela chave (string ou símbolo)
    data["post_id"] || data[:post_id]
  end.compact.map(&:to_i)

  @views_by_post = post_ids.tally
  
  @daily_views = Ahoy::Event.where(name: "Viewed Post").group_by_day(:time, last: 7).count
end


  def dashboard
    # Total de visitas nos últimos 7 dias
    @visits_count = Ahoy::Visit.where(started_at: 7.days.ago..Time.current).count
    
    # Posts mais lidos
    @top_posts = Ahoy::Event.where(name: "Viewed Post")
                            .group("properties -> 'post_id'")
                            .count
                            .sort_by { |_id, count| -count }
                            .first(5)
  end
end