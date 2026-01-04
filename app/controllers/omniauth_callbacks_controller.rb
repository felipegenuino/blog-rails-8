class OmniauthCallbacksController < ApplicationController
  # No Rails 8, permitimos acesso sem login para o callback
  allow_unauthenticated_access

  def github
    auth = request.env["omniauth.auth"]
    
    # Busca ou cria o usuário baseado no UID e Provider do GitHub
    @user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize do |u|
      u.email_address = auth.info.email
      u.password = SecureRandom.hex(16) # Senha aleatória forte
      u.role = :reader # Novo usuário entra como leitor
    end

    if @user.save
      # Cria a sessão seguindo o padrão do Rails 8
      session_record = @user.sessions.create!
      resume_session(session_record) # Método interno do Authentication concern do Rails 8
      
      redirect_to root_path, notice: "Bem-vindo, #{@user.email_address}! Você logou via GitHub."
    else
      redirect_to new_session_path, alert: "Não conseguimos completar seu login via GitHub."
    end
  end
end