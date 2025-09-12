class AddNewToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :new, :boolean
  end
end
