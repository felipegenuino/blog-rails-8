class AddYoutubeUrlToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :youtube_url, :string
  end
end
