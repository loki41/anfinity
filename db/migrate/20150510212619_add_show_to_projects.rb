class AddShowToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :show, :boolean, default: true
  end
end
