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
    Link as LinkIcon, // Renomeado para não conflitar com palavras reservadas
    Twitter,
    Linkedin
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
            Linkedin
        }
    })
}

// O Turbo do Rails 8 exige que reinicializemos os ícones a cada navegação
document.addEventListener("turbo:load", initializeIcons)
document.addEventListener("turbo:render", initializeIcons)