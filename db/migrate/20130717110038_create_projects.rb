class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :category
      t.string :customer
      t.text :description
      t.string :feature_image
      t.string :tech
      t.string :duration
      t.text :features

      t.timestamps
    end
  end
end
