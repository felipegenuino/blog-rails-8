// app/views/pwa/service-worker.js.erb

const CACHE_NAME = "devblog-v1";
const OFFLINE_ASSETS = [
    "/",
    "/assets/application.css",
    "/assets/application.js",
    "/offline.html" // Crie uma página simples de "Você está offline"
];

// Instala o service worker e guarda os arquivos essenciais
self.addEventListener("install", (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME).then((cache) => cache.addAll(OFFLINE_ASSETS))
    );
});

// Intercepta as requisições
self.addEventListener("fetch", (event) => {
    if (event.request.mode === "navigate") {
        event.respondWith(
            fetch(event.request).catch(() => {
                return caches.match("/") || caches.match("/offline.html");
            })
        );
    }
});