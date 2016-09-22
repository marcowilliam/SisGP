json.array!(@projetos) do |projeto|
  json.extract! projeto, :id
  json.url projeto_url(projeto, format: :json)
end
