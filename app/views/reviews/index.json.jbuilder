json.array!(@reviews) do |review|
  json.extract! review, :id, :title, :author, :content, :rating, :laborer_id
  json.url review_url(review, format: :json)
end
