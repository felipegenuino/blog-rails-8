module PostsHelper
  def youtube_thumbnail_url(url, quality = 'maxresdefault')
    return nil if url.blank?
    video_id = url.match(/(?:v=|youtu\.be\/)([^&?]+)/)[1] rescue nil
    # Se o video_id for nil, ele vai cair no else do seu index.html.erb
    "https://img.youtube.com/vi/#{video_id}/#{quality}.jpg" if video_id
  end

  def youtube_embed(url)
    # ... seu código atual do embed (está ótimo!)
    return if url.blank?
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