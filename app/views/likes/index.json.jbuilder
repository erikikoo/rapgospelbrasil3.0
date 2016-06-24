json.array!(@likes) do |like|
  json.extract! like, :id, :artist_data_id, :ip, :like, :unlike
  json.url like_url(like, format: :json)
end
