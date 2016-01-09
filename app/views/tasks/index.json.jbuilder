json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :whattodo
  json.url task_url(task, format: :json)
end
