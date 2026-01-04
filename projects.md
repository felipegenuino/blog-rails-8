### `projects.md`

```markdown
# 🚀 Project: Blog Rails 8 (Dev Log)

## 🎯 Objetivo
Plataforma de conteúdo técnico focada em alta performance, SEO e monetização através de conteúdo restrito (Área VIP).

## 🛠 Stack Tecnológica
* **Framework:** Rails 8.0.x (Autenticação Nativa)
* **Frontend:** Tailwind CSS + Lucide Icons
* **Interatividade:** Hotwire (Turbo Streams & Stimulus)
* **Auth Social:** GitHub OAuth (OmniAuth)
* **Analytics:** Ahoy (Métricas de visualização)
* **Banco de Dados:** SQLite3 (Local) / Solid Cache

## 🏗 Arquitetura & Decisões Técnicas
* **User Roles:** Sistema de permissões baseado em ENUM (`reader`, `admin`, `vip`).
* **SEO Engine:** FriendlyId para slugs e geração dinâmica de Meta Tags.
* **Sync de Perfil:** Atualização de avatar e dados em tempo real via provedor OAuth.
* **Segurança:** Namespace Admin isolado e página 404 customizada para UX.

## 🗺 Roadmap

### Fase 1: MVP & Fundações ✅
* [x] Configuração inicial Rails 8 e Tailwind.
* [x] Autenticação nativa + Login Social (GitHub).
* [x] Comentários dinâmicos com Turbo Streams.
* [x] Dashboard Administrativo com métricas de views.
* [x] Tratamento de erros 404 personalizado.

### Fase 2: SEO, Testes & Deploy 🔨
* [ ] Implementação de Sitemap.xml dinâmico.
* [ ] Cobertura de testes unitários e de sistema (Minitest).
* [ ] Deploy em produção (Render/Fly.io) utilizando Solid Queue.
* [ ] Implementação de busca global nos posts.

### Fase 3: Área VIP & Monetização 💰
* [ ] **Status VIP:** Lógica de expiração e níveis de acesso.
* [ ] **Paywall:** Integração com Stripe para assinaturas recorrentes.
* [ ] **Conteúdo Premium:** Bloqueio parcial de posts (estilo Substack).
* [ ] **Newsletter:** Automação de e-mails para novos posts e ofertas.

---
*Última atualização: 04 de Janeiro de 2026*

```

---

**Dica:** No `README.dev.md`, lembre-se de que se você mudar o e-mail no arquivo `db/seeds.rb`, deve atualizar o README também para não se esquecer!

Bom descanso e nos vemos na Fase 2! 🚀💤