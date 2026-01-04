class ErrorsController < ApplicationController
  # Não precisamos de autenticação para ver a página de erro
  allow_unauthenticated_access

  def not_found
    render status: :not_found
  end
end