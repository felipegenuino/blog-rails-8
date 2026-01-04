Essa é uma excelente visão de futuro para transformar o blog num produto rentável! Adicionar uma **Área VIP** com sistema de pagamentos e restrição de conteúdo é o caminho clássico para monetizar autoridade técnica.

Já atualizei o seu `projects.md` para incluir essa nova fase no Roadmap e na arquitetura. Aqui está o conteúdo atualizado para guardares:

---

# 🚀 Project: Blog Rails 8 (Dev Log)

## 🎯 Objetivo

Criar uma plataforma de conteúdo técnico focada em performance, SEO e experiência do desenvolvedor, utilizando as novas convenções do Rails 8.

## 🛠 Stack Tecnológica

* **Framework:** Rails 8.0.x
* **Frontend:** Tailwind CSS
* **Banco de Dados:** SQLite3 (Local) / Solid Cache
* **Rich Text:** Action Text (Trix)
* **Icons:** Lucide Icons
* **SEO:** FriendlyId & Sitemap Generator

## 🏗 Arquitetura & Decisões Técnicas

* **Slugs Amigáveis:** Uso do `FriendlyId` para transformar `id` em `slug`.
* **UI/UX Premium:** Design baseado em cards e bordas arredondadas (3xl).
* **Controle de Acesso (Futuro):** Implementação de níveis de permissão (Free vs. VIP).
* **Integração de Pagamentos:** Planeado o uso de Stripe API para subscrições.

## 🗺 Roadmap

### Fase 1: MVP & Fundações ✅

* [x] Configuração inicial Rails 8.
* [x] Autenticação básica e Admin Dashboard.
* [x] Implementação do Action Text com upload de imagens.
* [x] Padronização visual (Tailwind Layers).

### Fase 2: SEO & Polimento 🔨

* [ ] Gerar e validar Sitemap.xml.
* [ ] Configuração de Meta Tags Dinâmicas.
* [ ] Implementação de Testes Automatizados (Minitest).
* [ ] Deploy em produção (Render/Fly.io).

### Fase 3: Área VIP & Monetização 💰

* [ ] **Sistema de User Roles:** Diferenciar leitores comuns de membros VIP.
* [ ] **Conteúdo Restrito:** Criar decorators/helpers para esconder partes do post ou tutoriais inteiros.
* [ ] **Paywall:** Integração com Stripe para subscrições mensais/anuais.
* [ ] **Dashboard do Aluno:** Área exclusiva para acesso a tutoriais premium.

---

### O que isso muda tecnicamente para ti:

1. **Devise (Autenticação):** No futuro, vamos expandir o uso do Devise (ou do sistema de autenticação nativo do Rails 8) para aceitar registos de leitores, não apenas do admin.
2. **Pundit ou CanCanCan:** Vamos precisar de uma destas *gems* para gerir as permissões (ex: "Só quem é VIP pode ver este vídeo").
3. **Stripe:** É a melhor escolha para Rails. Eles têm uma gem oficial fantástica que lida com cartões de crédito e subscrições de forma muito segura.

**Boa viagem com o MacBook hoje!** Com este `projects.md` atualizado, tens um plano de negócio real para o teu blog. Quando estiveres pronto para codar a restrição de conteúdo, avisa!




## Install


### Apaga o banco, cria de novo e roda as migrações (inclusive a do 'role' e 'premium')
rails db:drop db:create db:migrate

### Agora sim, roda o seed
rails db:seed

### Roda o projeto
bin/dev  