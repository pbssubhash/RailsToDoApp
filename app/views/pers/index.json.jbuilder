json.array!(@pers) do |per|
  json.extract! per, :id, :person, :honest
  json.url per_url(per, format: :json)
end
