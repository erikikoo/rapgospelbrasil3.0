json.array!(@videos) do |video|
  json.extract! video, :id, :artist_data_id, :link
  json.url video_url(video, format: :json)
end
