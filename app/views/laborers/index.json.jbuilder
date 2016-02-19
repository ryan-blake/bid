json.array!(@laborers) do |laborer|
  json.extract! laborer, :id
  json.url laborer_url(laborer, format: :json)
