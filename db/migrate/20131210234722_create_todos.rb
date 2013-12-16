class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.string :kind
      t.string :location
      t.string :status
      t.date :due

      t.timestamps
    end
  end
end
