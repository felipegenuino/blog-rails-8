# db/seeds.rb

puts "🧹 Limpando banco de dados..."
Post.destroy_all
User.destroy_all

puts "🔐 Criando usuário administrador..."
User.create!(
  email_address: "email@dev.test",
  password: "Test@01"
  password_confirmation: "Test@01",
  role: :admin
)

# Dados para sortear
titles = [
  "O Futuro do Rails 8", "Dominando Tailwind v4", "Dicas de Produtividade", 
  "Por que usar SQLite?", "Hotwire vs React", "Deploy com Kamal",
  "Ruby 3.4 no Mac M3", "Clean Code no Rails", "Testes com Minitest",
  "O Guia do Junior Senior", "Performance em Ruby", "Docker vs Kamal",
  "O fim do Webpack?", "Padrões de Projeto", "Refatoração Prática"
]

paragraphs = [
  "No mundo do desenvolvimento moderno, a agilidade é fundamental. O Rails 8 traz ferramentas que permitem focar no produto final sem se preocupar com a infraestrutura complexa que víamos antigamente.",
  "Estilizar interfaces nunca foi tão simples. O Tailwind v4 remove a complexidade de arquivos CSS gigantescos e traz performance através de sua nova engine de compilação ultra-rápida.",
  "Manter um código limpo não é luxo, é necessidade. Pequenas refatorações diárias evitam que o projeto vire um pesadelo técnico e garantem que a equipe consiga entregar valor constantemente.",
  "A experiência do desenvolvedor (DX) no macOS é fluida, especialmente usando gerenciadores como asdf para controlar versões de Ruby, Node e outras ferramentas essenciais do dia a dia.",
  "Muitas vezes, o menos é mais. Reduzir dependências externas e focar no que o Rails oferece 'out-of-the-box' pode tornar seu blog ou aplicação muito mais fácil de manter a longo prazo."
]

youtube_links = [
  "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
  "https://www.youtube.com/watch?v=Syb6_8m6p-M",
  "https://www.youtube.com/watch?v=R9ITLdmfdLI"
]

puts "📝 Gerando 30 posts variados..."

30.times do |i|
  # Definimos o tipo de post para variar o conteúdo
  # A cada 4 posts, um é vídeo. Se não, sorteamos entre nota (curto) e artigo (longo)
  is_video = (i % 4 == 0)
  is_note  = !is_video && (rand > 0.7) # 30% de chance de ser nota se não for vídeo

  current_title = titles.sample + " ##{i + 1}"
  content_html = "<div>"

  if is_note
    # Nota: Apenas um parágrafo simples
    content_html += "<p>#{paragraphs.sample}</p>"
    current_title = "📝 Nota: " + current_title
  else
    # Artigo ou Vídeo: Conteúdo mais denso
    content_html += "<h2>#{current_title}</h2>"
    content_html += "<p>#{paragraphs.sample}</p>"
    content_html += "<ul><li>Tópico importante A</li><li>Dica técnica B</li></ul>"
    content_html += "<blockquote>#{paragraphs.sample}</blockquote>"
    content_html += "<p>#{paragraphs.sample}</p>"
  end
  
  content_html += "</div>"

 
  Post.create!(
    title: current_title,
    content: content_html,
    youtube_url: is_video ? youtube_links.sample : nil,
    # Sorteia: 20% de chance de ser um post exclusivo para assinantes
    premium: (rand > 0.8), 
    created_at: Time.current - i.hours - rand(1..15).days,
    updated_at: Time.current
  )
  
  print "🚀" if (i + 1) % 5 == 0
end

puts "\n\n✨ Sucesso!"
puts "✅ 1 Admin criado (design@felipegenuino.com)"
puts "✅ 30 Posts gerados (com Vídeos, Notas e Artigos)"