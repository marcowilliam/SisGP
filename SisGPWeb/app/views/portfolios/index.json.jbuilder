json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :nome, :descricao, :dataInicio, :dataFim
  json.url portfolio_url(portfolio, format: :json)
end
