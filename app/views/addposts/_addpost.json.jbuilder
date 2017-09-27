json.extract! addpost, :id, :title, :body, :text, :created_at, :updated_at
json.url addpost_url(addpost, format: :json)
