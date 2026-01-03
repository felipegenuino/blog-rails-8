import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

// Importamos os ícones necessários do Lucide
import {
    createIcons,
    Pencil,
    Trash2,
    ArrowLeft,
    LayoutDashboard,
    Plus,
    PlusCircle,
    Save,
    X,
    LogIn,
    User,
    Lock,
    LogOut,
    Settings,
    Settings2,
    Mail,
    CheckCircle,
    AlertCircle,
    Files,
    Video,
    StickyNote,
    Clock,
    Eye,
    ChevronDown,
    Search,
    PlayCircle,
    FileText,
    ArrowRight,
    Link as LinkIcon, // Renomeado para não conflitar com palavras reservadas
    Twitter,
    Linkedin,
    Youtube,
    Sparkles
} from "lucide"

// Função para inicializar os ícones na tela
const initializeIcons = () => {
    createIcons({
        icons: {
            Pencil,
            Trash2,
            ArrowLeft,
            LayoutDashboard,
            Plus,
            PlusCircle,
            Save,
            X,
            LogIn,
            User,
            Lock,
            LogOut,
            Settings,
            Settings2,
            Mail,
            CheckCircle,
            AlertCircle,
            Files,
            Video,
            StickyNote,
            Clock,
            Eye,
            ChevronDown,
            Search,
            Link: LinkIcon,
            Twitter,
            Linkedin,
            Youtube,
            PlayCircle,
            FileText,
            ArrowRight,
            Sparkles
        }
    })
}

// O Turbo do Rails 8 exige que reinicializemos os ícones a cada navegação
document.addEventListener("turbo:load", initializeIcons)
document.addEventListener("turbo:render", initializeIcons)


// Adiciona suporte a h1, H2 e H3 no Trix
document.addEventListener("trix-initialize", function (event) {
    const { toolbarElement } = event.target

    // 1. Definimos os novos atributos de bloco (H1, H2, H3)
    // O Trix já tem o heading1, mas vamos garantir as tags h1, h2 e h3
    Trix.config.blockAttributes.heading1 = { tagName: "h1", terminal: true, breakOnReturn: true, group: "block" }
    Trix.config.blockAttributes.heading2 = { tagName: "h2", terminal: true, breakOnReturn: true, group: "block" }
    Trix.config.blockAttributes.heading3 = { tagName: "h3", terminal: true, breakOnReturn: true, group: "block" }

    // 2. Localizamos o botão TT original (heading1)
    const ttButton = toolbarElement.querySelector("[data-trix-attribute=heading1]")

    // 3. Injetamos os novos botões e removemos o TT
    if (ttButton) {
        ttButton.insertAdjacentHTML("afterend", `
      <button type="button" class="trix-button" data-trix-attribute="heading1" title="H1">H1</button>
      <button type="button" class="trix-button" data-trix-attribute="heading2" title="H2">H2</button>
      <button type="button" class="trix-button" data-trix-attribute="heading3" title="H3">H3</button>
    `)
        ttButton.remove() // Tira o "TT" da jogada
    }
})