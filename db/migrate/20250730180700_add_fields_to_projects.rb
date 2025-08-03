class AddFieldsToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :published, :boolean
    add_column :projects, :figma_file, :string
    add_column :projects, :figma_prototype, :string
  end
end
