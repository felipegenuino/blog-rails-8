### Arquivo: `README.dev.md`

```markdown
# 🛠 Configuração do Ambiente de Desenvolvimento

Este projeto utiliza o **asdf** como gerenciador de versões para garantir que todos os desenvolvedores utilizem as mesmas versões de Ruby, Node e outras ferramentas.

## 1. Pré-requisitos

Antes de começar, certifique-se de ter o [Homebrew](https://brew.sh/) instalado (para usuários de macOS).

## 2. Instalando o asdf

Se ainda não tiver o `asdf` instalado:

```bash
brew install asdf

```

Adicione o asdf ao seu shell (`~/.zshrc` ou `~/.bashrc`):

```bash
echo '. "$(brew --prefix asdf)/libexec/asdf.sh"' >> ~/.zshrc
source ~/.zshrc

```

## 3. Configurando Plugins e Versões

Dentro da pasta do projeto, siga os passos abaixo para instalar as versões exatas definidas no arquivo `.tool-versions`:

### Ruby

```bash
# Adicionar o plugin
asdf plugin add ruby

# Instalar a versão necessária
asdf install ruby 3.3.4

# Definir como local (caso não reconheça automaticamente)
asdf set ruby 3.3.4

```

### Node.js (necessário para o Tailwind/Assets)

```bash
asdf plugin add nodejs
asdf install nodejs latest
asdf set nodejs latest

```

## 4. Inicializando o Projeto

Com as versões configuradas, instale as dependências e prepare o banco de dados:

```bash
# Instalar dependências
gem install bundler
bundle install
yarn install # ou npm install

# Preparar banco de dados
bin/rails db:prepare

# Rodar o servidor de desenvolvimento
bin/dev

```

## 5. Comandos Úteis

* `asdf current`: Verifica as versões que estão ativas no momento.
* `asdf install`: Instala todas as versões listadas no `.tool-versions` de uma vez.
* `bin/dev`: Roda o Rails e o Tailwind v4 em modo watch simultaneamente.

---

```



### Por que isso é importante?
Se amanhã você precisar formatar o Mac ou outro desenvolvedor for te ajudar, basta ele rodar `asdf install` e o `asdf` vai ler o arquivo `.tool-versions` e baixar tudo sozinho, sem erro de "versão não encontrada".

**Quer que eu adicione uma seção sobre como testar os inputs do YouTube que a gente planejou ou prefere manter focado só no setup por enquanto?**

```