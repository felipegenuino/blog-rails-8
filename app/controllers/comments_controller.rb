class CommentsController < ApplicationController
  include Authentication

  # resume_session garante que o Current.user seja carregado dos cookies
  before_action :resume_session
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.build(comment_params)
    
    if authenticated?
      @comment.user = Current.user
      
      if @comment.save
        redirect_to @post, notice: "Comentário enviado com sucesso!"
      else
        redirect_to @post, alert: "Erro: #{@comment.errors.full_messages.to_sentence}"
      end
    else
      redirect_to new_session_path, alert: "Você precisa estar logado para comentar."
    end
  end

  def destroy
    # Verificação de segurança: apenas o dono do comentário ou um admin pode apagar
    if @comment.user == Current.user || Current.user&.admin?
      @comment.destroy
      redirect_to @post, notice: "Comentário excluído."
    else
      redirect_to @post, alert: "Você não tem permissão para excluir este comentário."
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end