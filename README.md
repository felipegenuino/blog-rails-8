 

### `README.dev.md`

```markdown
# 🛠 Guia de Desenvolvimento - Blog Rails 8

Este guia contém os comandos essenciais para configurar e rodar o projeto rapidamente.

## 🚀 Setup Inicial

1. **Instalar dependências**
   ```bash
   bundle install
   yarn install

```

2. **Resetar o Banco de Dados**
(Apaga o banco atual, cria um novo, roda as migrações e popula os dados iniciais)
```bash
rails db:drop db:create db:migrate db:seed

```


3. **Rodar o Servidor de Desenvolvimento**
(Inicia o Rails e o compilador de CSS/JS)
```bash
bin/dev

```



## 🔐 Credenciais de Teste (Seed)

Após rodar o `db:seed`, utilize os dados abaixo para acessar o admin:

* **E-mail:** `admin@admin.com`
* **Senha:** `password`

## 🛠 Comandos do Dia a Dia

* **Limpar logs:** `rails log:clear`
* **Console do Rails:** `rails c`
* **Listar Rotas:** `rails routes`
* **Verificar erros de lint:** `bundle exec rubocop`

 

 