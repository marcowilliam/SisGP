json.array!(@atividades) do |atividade|
  json.extract! atividade, :id, :nome, :descricao, :dataInicio, :dataFim
  json.url atividade_url(atividade, format: :json)
end
