module CategoriesHelper
  def cat cat
    Category.find_by_id(cat.category).name
  end
end
