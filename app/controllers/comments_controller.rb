class CommentsController < ApplicationController
  include Authentication

  before_action :resume_session
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = Current.user
    
    respond_to do |format|
      if @comment.save
        format.turbo_stream # Procurará o arquivo create.turbo_stream.erb
        format.html { redirect_to @post, notice: "Comentário enviado!" }
      else
        format.html { redirect_to @post, alert: "Erro: #{@comment.errors.full_messages.to_sentence}" }
      end
    end
  end

  def destroy
    if @comment.user == Current.user || Current.user&.admin?
      @comment.destroy
      
      respond_to do |format|
        format.turbo_stream # Procurará o arquivo destroy.turbo_stream.erb
        format.html { redirect_to @post, notice: "Comentário excluído." }
      end
    else
      redirect_to @post, alert: "Sem permissão."
    end
  end

  private

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end