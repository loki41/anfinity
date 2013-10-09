class AddSiteLinkToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :site_link, :string
  end
end
