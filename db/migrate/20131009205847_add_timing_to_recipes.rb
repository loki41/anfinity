class AddTimingToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :prep, :string
    add_column :recipes, :cooking, :string
    add_column :recipes, :serves, :string
    add_column :recipes, :tips, :text
    add_column :recipes, :additional_info, :text
  end
end
