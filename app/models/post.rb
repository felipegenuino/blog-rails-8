 


class Post < ApplicationRecord
  # Isso cria uma associação mágica com o Action Text
  has_rich_text :content 
  
  # Validações básicas
  validates :title, presence: true
  
  # Enum para diferenciar o tipo de post
  enum :content_type, { article: 0, video: 1, note: 2 }

end