class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :summary
      t.integer :content_type
      t.datetime :published_at

      t.timestamps
    end
  end
end
