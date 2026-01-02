class Admin::DashboardController < ApplicationController
  # No Rails 8, o gerador de autenticação cria o método resume_session ou similar.
  # Se você seguiu o passo anterior, use:
  before_action :require_authentication

  def index
    @posts_count = Post.count
    @recent_posts = Post.order(created_at: :desc).limit(5)
  end
end
