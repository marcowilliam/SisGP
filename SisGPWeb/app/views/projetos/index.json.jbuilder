json.array!(@projetos) do |projeto|
  json.extract! projeto, :id, :nome, :descricao, :dataInicio, :dataFim
  json.url projeto_url(projeto, format: :json)
end
