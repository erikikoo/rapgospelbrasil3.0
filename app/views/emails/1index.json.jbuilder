json.array!(@emails) do |email|
  json.extract! email, :id, :artist_data_id, :email
  json.url email_url(email, format: :json)
end
