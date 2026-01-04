class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Adicione isso para gerenciar os níveis de acesso
  enum :role, { reader: 0, premium: 1, admin: 2 }, default: :reader
  validates :email_address, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
