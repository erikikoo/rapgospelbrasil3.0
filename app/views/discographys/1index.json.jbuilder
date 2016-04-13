json.array!(@discographys) do |discography|
  json.extract! discography, :id, :artist_data_id, :nome, :data
  json.url discography_url(discography, format: :json)
end
