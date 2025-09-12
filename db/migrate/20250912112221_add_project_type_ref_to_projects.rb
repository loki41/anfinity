class AddProjectTypeRefToProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :projects, :project_type, foreign_key: true

    # create a default type if none exist
    default_type = ProjectType.first || ProjectType.create!(name: "Uncategorized")

    # backfill existing projects
    Project.where(project_type_id: nil).update_all(project_type_id: default_type.id)

    # now enforce NOT NULL
    change_column_null :projects, :project_type_id, false
  end
end
