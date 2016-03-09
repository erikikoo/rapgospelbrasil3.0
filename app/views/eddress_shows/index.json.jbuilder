json.array!(@eddress_shows) do |eddress_show|
  json.extract! eddress_show, :id, :commitment_id, :local, :endereco, :numero, :telefone, :site
  json.url eddress_show_url(eddress_show, format: :json)
end
