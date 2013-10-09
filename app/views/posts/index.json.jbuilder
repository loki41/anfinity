json.array!(@posts) do |post|
  json.extract! post, :title, :content, :category
  json.url post_url(post, format: :json)
end