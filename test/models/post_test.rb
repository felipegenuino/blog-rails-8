require "test_helper"
require "application_system_test_case"

class PostTest < ActiveSupport::TestCase
  test "não deve salvar post sem título" do
    post = Post.new(content: "Conteúdo legal")
    assert_not post.save, "Salvou o post sem título (isso é um erro!)"
  end

  test "deve salvar post com dados completos" do
    post = Post.new(title: "Meu Post de Teste", content: "Conteúdo aqui", content_type: :article)
    assert post.save
  end
end

class PostsTest < ApplicationSystemTestCase
  test "visitando a index e criando um post" do
    visit posts_path
    assert_selector "h1", text: "Posts" # Verifica se o título da página está lá

    click_on "Novo Post" # Ou o texto que estiver no seu botão

    fill_in "Título do Post", with: "Post via Teste Automatizado"
    # Para o Trix, usamos um comando especial:
    find("trix-editor").set("Este é o conteúdo do teste")
    
    click_on "Publicar Post"

    assert_text "Post criado com sucesso"
  end
end

 # test/models/post_test.rb
test "não deve salvar post sem título" do
  post = Post.new(text_content: "Apenas conteúdo")
  assert_not post.save
end