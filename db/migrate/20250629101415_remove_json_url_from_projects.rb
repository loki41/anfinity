class RemoveJsonUrlFromProjects < ActiveRecord::Migration[8.0]
  def change
    remove_column :projects, :json_url, :string
  end
end
