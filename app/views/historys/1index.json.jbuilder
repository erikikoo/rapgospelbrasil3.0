json.array!(@historys) do |history|
  json.extract! history, :id, :artist_data_id, :historia
  json.url history_url(history, format: :json)
end
