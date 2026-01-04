class OmniauthCallbacksController < ApplicationController
  # No Rails 8, geralmente pulamos a autenticação para o callback do OAuth
  allow_unauthenticated_access

  # app/controllers/omniauth_callbacks_controller.rb
  # app/controllers/omniauth_callbacks_controller.rb
 # app/controllers/omniauth_callbacks_controller.rb
  def github
    auth = request.env["omniauth.auth"]
    
    # 1. Busca pelo e-mail (ou cria um novo se não existir)
    @user = User.find_or_initialize_by(email_address: auth.info.email)

    # 2. MAPEAMENTO: Aqui você garante que a foto será salva/atualizada
    @user.avatar_url = auth.info.image
    
    # 3. Outros dados úteis (opcional, mas recomendado)
    @user.provider = auth.provider
    @user.uid = auth.uid

    # 4. Se for novo, gera senha
    if @user.new_record?
      @user.password = SecureRandom.hex(16)
    end

    # 5. SALVAMENTO: Isso é o que faltava para atualizar o banco
    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Logado com sucesso!"
    else
      # Se der erro, você verá no terminal (bin/dev)
      logger.error "Erro ao salvar usuário: #{@user.errors.full_messages}"
      redirect_to new_session_path, alert: "Erro ao autenticar."
    end
  end

  def failure
    redirect_to new_session_path, alert: "Falha na autenticação. Tente novamente."
  end
end