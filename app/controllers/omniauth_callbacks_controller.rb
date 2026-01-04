class OmniauthCallbacksController < ApplicationController
    # No Rails 8, permitimos acesso sem login para o callback
    allow_unauthenticated_access

    # app/controllers/omniauth_callbacks_controller.rb
    def github
        auth = request.env["omniauth.auth"]
        
        @user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize do |u|
            u.email_address = auth.info.email
            u.password = SecureRandom.hex(16)
            u.role = :reader
        end

        if @user.save
            # No Rails 8, criamos a sessão e guardamos o ID no cookie assinado
            session_record = @user.sessions.create!
            cookies.signed.permanent[:session_id] = { value: session_record.id, httponly: true, same_site: :lax }
            
            redirect_to root_path, notice: "Bem-vindo, #{@user.email_address}! Logado via GitHub."
        else
            redirect_to new_session_path, alert: "Erro ao salvar usuário do GitHub."
        end
    end

end