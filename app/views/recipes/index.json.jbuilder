json.array!(@recipes) do |recipe|
  json.extract! recipe, :name, :description, :intructions, :ingredients, :image, :slug
  json.url recipe_url(recipe, format: :json)
end