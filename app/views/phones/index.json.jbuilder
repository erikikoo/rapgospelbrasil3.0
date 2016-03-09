json.array!(@phones) do |phone|
  json.extract! phone, :id, :artist_data_id, :telefone
  json.url phone_url(phone, format: :json)
end
