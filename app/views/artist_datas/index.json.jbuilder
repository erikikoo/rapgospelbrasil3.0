json.array!(@artist_datas) do |artist_data|
  json.extract! artist_data, :id, :nome, :historia
  json.url artist_data_url(artist_data, format: :json)
end
