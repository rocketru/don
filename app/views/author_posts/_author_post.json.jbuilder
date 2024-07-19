json.extract! author_post, :id, :author_id, :title, :created_at, :updated_at
json.url author_post_url(author_post, format: :json)
