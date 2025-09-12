class CreateViews < ActiveRecord::Migration[8.0]
  def change
    create_table :views do |t|
      t.references :project, null: false, foreign_key: true
      t.datetime :viewed_at

      t.timestamps
    end
  end
end
