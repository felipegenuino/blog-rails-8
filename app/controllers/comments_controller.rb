class CommentsController < ApplicationController
  before_action :resume_session # Garante que Current.user esteja preenchido
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = Current.user

    if @comment.save
      redirect_to @post, notice: "Comentário publicado com sucesso!"
    else
      redirect_to @post, alert: "O comentário não pode estar vazio."
    end
  end

  def destroy
    # Segurança: Só deleta se for o dono do comentário ou admin
    if @comment.user == Current.user || Current.user&.admin?
      @comment.destroy
      redirect_to @post, notice: "Comentário removido."
    else
      redirect_to @post, alert: "Você não tem permissão para isso."
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