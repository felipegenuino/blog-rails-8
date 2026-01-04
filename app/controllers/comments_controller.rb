class CommentsController < ApplicationController
  # Importante: No Rails 8, isso preenche o Current.user a partir do cookie
  before_action :resume_session 

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    
    # Debug: vai aparecer no seu terminal onde roda o 'bin/dev'
    puts "DEBUG: Tentando comentar como usuário: #{Current.user&.email_address}"

    if authenticated?
      @comment.user = Current.user
      if @comment.save
        redirect_to @post, notice: "Comentário publicado com sucesso!"
      else
        redirect_to @post, alert: "Erro nas validações: #{@comment.errors.full_messages.to_sentence}"
      end
    else
      redirect_to new_session_path, alert: "Você precisa estar logado para comentar."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end