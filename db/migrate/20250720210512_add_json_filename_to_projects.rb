class AddJsonFilenameToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :json_filename, :string
  end
end
