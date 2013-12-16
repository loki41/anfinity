json.array!(@todos) do |todo|
  json.extract! todo, :name, :type, :location, :status, :due
  json.url todo_url(todo, format: :json)
end