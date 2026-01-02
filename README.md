Claro! Como aqui não temos o "Canvas" exatamente igual ao da OpenAI, vou usar um **bloco de código Markdown completo**. Você pode clicar no botão de copiar (ícone de prancheta) que aparece no canto superior do bloco para pegar o texto inteiro de uma vez.

```markdown
# 🚀 Rails 8 Blog - Guia de Implementação (Estilo WordPress)

Este guia resume os passos essenciais para criar um blog com suporte a mídias e autenticação nativa, focando nas soluções para os problemas comuns de ambiente (WSL/Linux).

---

## 1. Setup de Modelagem e Autenticação
O Rails 8 possui autenticação nativa. O scaffold cria a base do CRUD.

```bash
# 1. Gerar sistema de login nativo
bin/rails generate authentication

# 2. Gerar a estrutura de Posts
bin/rails generate scaffold Post title:string summary:text content_type:integer published_at:datetime

# 3. Rodar as migrações
bin/rails db:migrate

```

**Dica:** No arquivo `app/models/post.rb`, defina os tipos de conteúdo:
`enum :content_type, { article: 0, video: 1, note: 2 }`

---

## 2. Configuração de Mídia (Action Text + Active Storage)

Essencial para suportar o editor "estilo WordPress" (arrastar e soltar imagens/vídeos).

```bash
bin/rails action_text:install
bin/rails active_storage:install
bin/rails db:migrate

```

### ⚠️ Dependência de Sistema (Crítico para WSL)

Sem a biblioteca de processamento de imagem, o upload falha silenciosamente:

```bash
sudo apt-get update
sudo apt-get install libvips42

```

---

## 3. Ajustes de Código "Anti-Erro"

### No Modelo (`app/models/post.rb`)

Habilite o campo de texto rico:

```ruby
class Post < ApplicationRecord
  has_rich_text :content
end

```

### No Controller (`app/controllers/posts_controller.rb`)

**Importante:** Use `permit` em vez de `expect` para garantir que o objeto de mídia do Action Text seja aceito:

```ruby
def post_params
  params.require(:post).permit(:title, :summary, :content_type, :published_at, :content)
end

```

---

## 4. Visualização e Exclusão

### Exibindo Conteúdo (`show.html.erb`)

Use a classe `trix-content` para que o CSS de imagens e vídeos funcione:

```erb
<div class="trix-content">
  <%= @post.content %>
</div>

```

### Botão de Deletar

No Rails 8, ações de destruição devem usar `button_to` para funcionar com o Turbo:

```erb
<%= button_to "Excluir Post", @post, method: :delete, data: { confirm: "Tem certeza?" } %>

```

---

## 5. Troubleshooting (Solução de Problemas)

* **Imagem não aparece:** Verifique se instalou a `libvips42` no Linux.
* **Permissão de Pasta:** Se o erro for de escrita, rode: `sudo chmod -R 777 storage/`.
* **CSS faltando:** Verifique se `@import "actiontext.css";` está no seu arquivo CSS principal.
* **Login:** Crie seu usuário via terminal com `bin/rails console` -> `User.create!(email_address: "...", password: "...")`.

---

*Stack: Rails 8.0.4 | Ruby 3.2.0 | Tailwind CSS*

```

**Deseja que o próximo passo seja a personalização visual da Home Page usando Tailwind CSS?**

```