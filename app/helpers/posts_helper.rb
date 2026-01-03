module PostsHelper
  def youtube_embed(url)
    return if url.blank?
    
    # Extrai o ID do vídeo usando regex
    video_id = url.match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&? \/\s]{11})/)[1]
    
    content_tag(:div, class: "aspect-video my-8 shadow-2xl rounded-2xl overflow-hidden") do
      content_tag(:iframe, nil, 
        src: "https://www.youtube.com/embed/#{video_id}", 
        class: "w-full h-full", 
        frameborder: "0", 
        allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture", 
        allowfullscreen: true)
    end
  rescue
    content_tag(:p, "Link do YouTube inválido", class: "text-red-500")
  end
end