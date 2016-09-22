json.array!(@comentarios) do |comentario|
  json.extract! comentario, :id, :assunto, :conteudo
  json.url comentario_url(comentario, format: :json)
end
