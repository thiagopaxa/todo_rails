json.array!(@todos) do |todo|
  json.extract! todo, :id, :title, :private, :completed
  json.url todo_url(todo, format: :json)
end
