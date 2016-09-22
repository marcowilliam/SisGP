json.array!(@processos) do |processo|
  json.extract! processo, :id, :nome, :descricao, :dataInicio, :dataFim
  json.url processo_url(processo, format: :json)
end
