class PostsController < ApplicationController
 

  # Permite que visitantes vejam a lista e o post sem login
  allow_unauthenticated_access only: %i[ index show ]
  
  # O restante (new, edit, create, update, destroy) exige login
  before_action :set_post, only: %i[ show edit update destroy ]

  

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
    @featured_post = @posts.first     # O post mais novo
    @remaining_posts = @posts.drop(1) # Todos os outros menos o primeiro
  end

   # app/controllers/posts_controller.rb
  def show 
    # Tenta buscar pelo slug. Se falhar, tenta pelo ID (para links antigos).
    @post = Post.friendly.find(params[:id])

     # Lógica de Paywall
    if @post.premium? && !user_can_access_premium?
      flash[:alert] = "Este conteúdo é exclusivo para assinantes Premium."
      redirect_to root_path # Ou renderizar uma view de "Upgrade"
      return
    end

    
    # No Rails 8, usamos geralmente Current.user ou apenas 'authenticated?'
    unless authenticated? && Current.user&.admin?
      ahoy.track "Viewed Post", post_id: @post.id
    end
    
    rescue ActiveRecord::RecordNotFound
      
    # Se não achar nada, manda pra home com um aviso em vez de dar erro 500
    redirect_to posts_path, alert: "Conteúdo não encontrado."
  end
  

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end


   # Only allow a list of trusted parameters through.
    def post_params
           params.require(:post).permit(:title, :summary, :content_type, :published_at, :content, :youtube_url)
    end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      # Garante que volta para a página inicial de posts com uma mensagem
      format.html { redirect_to posts_path, status: :see_other, notice: "Post removido com sucesso." }
     
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      # O FriendlyId permite que você continue usando .find para IDs 
      # ou use o slug automaticamente.
      @post = Post.friendly.find(params[:id])
    end

    def user_can_access_premium?
      # Admin e Premium têm acesso total
      authenticated? && (Current.user.admin? || Current.user.premium?)
    end 

   
end
