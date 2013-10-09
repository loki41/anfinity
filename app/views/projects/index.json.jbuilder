json.array!(@projects) do |project|
  json.extract! project, :name, :category, :customer, :description, :feature_image, :tech, :duration, :features
  json.url project_url(project, format: :json)
end