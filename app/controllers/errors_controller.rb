class ErrorsController < ApplicationController
  # Não precisamos de autenticação para ver a página de erro
  allow_unauthenticated_access

    def not_found
      respond_to do |format|
        format.html
        format.json { render json: { error: "Not found" }, status: :not_found }
        format.any  { head :not_found }
      end
    end
end