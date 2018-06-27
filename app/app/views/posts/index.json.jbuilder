json.array!(@posts) do |post|
  json.extract! post, :id, :body, :attachment, :person_id, :parent_id, :parent_type
  json.url post_url(post, format: :json)
end
