json.array!(@departamentos) do |departamento|
  json.extract! departamento, :id
  json.url departamento_url(departamento, format: :json)
end
