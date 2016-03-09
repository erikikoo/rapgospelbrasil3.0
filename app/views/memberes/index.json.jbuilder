json.array!(@memberes) do |member|
  json.extract! member, :id, :artist_data_id, :nome
  json.url member_url(member, format: :json)
end
