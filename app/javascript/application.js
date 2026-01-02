import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

// Importamos apenas o que é estritamente necessário
import {
    createIcons,
    Pencil,
    Trash2,
    ArrowLeft,
    LayoutDashboard,
    Plus,
    Save,
    X,
    LogIn,
    User,
    Lock,
    LogOut,
    Settings,
    Mail,
    CheckCircle,
    AlertCircle,
    //ArrowLeft,
    Files,
    Video,
    StickyNote,
    Clock,
    Eye
} from "lucide"

const initializeIcons = () => {
    createIcons({
        icons: {
            Pencil,
            Trash2,
            ArrowLeft,
            LayoutDashboard,
            Plus,
            Save,
            X,
            LogIn,
            User,
            Lock,
            LogOut,
            Settings,
            Mail,
            CheckCircle,
            AlertCircle,
            //ArrowLeft,
            Files,
            Video,
            StickyNote,
            Clock,
            Eye
        }
    })
}

// Escuta tanto o carregamento inicial quanto as navegações do Turbo
document.addEventListener("turbo:load", initializeIcons)
document.addEventListener("turbo:render", initializeIcons)