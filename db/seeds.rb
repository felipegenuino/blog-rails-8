# db/seeds.rb

puts "🔐 Criando usuário administrador..."

# Usamos email_address conforme definido no seu Model
admin = User.find_or_create_by!(email_address: "admin@blog.com") do |u|
  u.password = "senha123"
  u.password_confirmation = "senha123"
end

puts "✅ Admin criado com sucesso!"
puts "📧 Email: admin@blog.com"
puts "🔑 Senha: senha123"

# Opcional: Criar alguns posts iniciais para não ver a tela vazia
unless Post.any?
  puts "📝 Criando posts de exemplo..."
  Post.create!(
    title: "Primeiro Post do Admin",
    content: "<h1>Olá Mundo!</h1><p>Este blog está rodando no Rails 8 com autenticação nativa.</p>",
    youtube_url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  )
end