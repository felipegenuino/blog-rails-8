class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  

  extend FriendlyId
  # Isso diz ao Rails para transformar o título em slug automaticamente
  friendly_id :title, use: :slugged

  # Opcional: Se você mudar o título, ele atualiza o slug
  def should_generate_new_friendly_id?
    title_changed?
  end
  
  # Isso cria uma associação mágica com o Action Text
  has_rich_text :content 
  
  # Validações básicas
  validates :title, presence: true
  
  validates :youtube_url, format: { with: /youtube\.com|youtu\.be/, message: "deve ser um link válido do YouTube" }, allow_blank: true
  
  # Enum para diferenciar o tipo de post
  enum :content_type, { article: 0, video: 1, note: 2 }

  

end