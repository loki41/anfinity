class SeedSampleProject < ActiveRecord::Migration[7.1]
  def up
    Project.create!(
      title: 'LXP dashboard',
      slug: 'lxp-dashboard',
      description: 'A full redesign of the dashboard experience for a leading elearning platform.',
      hero_image: 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', # Replace with actual image URL
      json_url: '/sample_project.json'
    )
  end

  def down
    Project.find_by(slug: 'lxp-dashboard')&.destroy
  end
end
