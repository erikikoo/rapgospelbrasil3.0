json.array!(@commitments) do |commitment|
  json.extract! commitment, :id, :artist_data_id, :local, :endereco, :numero, :telefone, :site, :data, :hora
  json.url commitment_url(commitment, format: :json)
end
