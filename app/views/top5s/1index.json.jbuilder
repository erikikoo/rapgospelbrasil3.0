json.array!(@top5s) do |top5|
  json.extract! top5, :id, :artist_id, :titulo, :rank
  json.url top5_url(top5, format: :json)
end
