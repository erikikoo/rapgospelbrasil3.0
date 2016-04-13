json.array!(@words) do |word|
  json.extract! word, :id, :artist_data_id, :titulo, :texto
  json.url word_url(word, format: :json)
end
