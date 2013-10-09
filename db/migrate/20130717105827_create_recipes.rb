class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :instructions
      t.text :ingredients
      t.string :image
      t.string :slug

      t.timestamps
    end
  end
end
