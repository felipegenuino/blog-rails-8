class Post < ApplicationRecord
    has_rich_text :body
    enum content_type: { article: 0, tutorial: 1, news: 2, video: 3, note: 4,  podcast: 5, review: 6, other: 7 }
    acts_as_taggable_on :tags
end
