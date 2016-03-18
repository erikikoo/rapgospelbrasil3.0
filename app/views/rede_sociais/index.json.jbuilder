json.array!(@rede_sociais) do |rede_social|
  json.extract! rede_social, :id, :artist_data_id, :facebook, :twitter, :instagram, :googleplus, :linkedid
  json.url rede_social_url(rede_social, format: :json)
end
