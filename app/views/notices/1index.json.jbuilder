json.array!(@notices) do |notice|
  json.extract! notice, :id, :artist_data_id, :noticia
  json.url notice_url(notice, format: :json)
end
