class AddMetaDataToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :meta_title, :string
    add_column :recipes, :meta_description, :text
    add_column :recipes, :meta_keywords, :string
  end
end
