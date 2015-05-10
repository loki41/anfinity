class AddShowToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :show, :boolean, default: 1
  end
end
