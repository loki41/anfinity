class AddMetaDataToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :meta_title, :string
    add_column :projects, :meta_description, :text
    add_column :projects, :meta_keywords, :string
  end
end
