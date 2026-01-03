class Admin::DashboardController < ApplicationController
  before_action :require_authentication


  def index
  @posts_count = Post.count
  @recent_posts = Post.order(created_at: :desc).limit(10)
  
  # Dados de Analytics
  @total_views = Ahoy::Event.where(name: "Viewed Post").count
  @daily_views = Ahoy::Event.where(name: "Viewed Post")
                          .group_by_day(:time, last: 7)
                          .count        
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