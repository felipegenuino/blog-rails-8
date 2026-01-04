class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Adicione isso para gerenciar os níveis de acesso
  enum :role, { reader: 0, premium: 1, admin: 2 }, default: :reader

  validates :email_address, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # Método para login social
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email_address = auth.info.email
      user.password = SecureRandom.hex(16) # Senha aleatória já que ele entra via social
      user.role = :reader
    end
  end

  
end
