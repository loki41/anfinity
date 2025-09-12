class ProjectType < ApplicationRecord
    has_many :projects, dependent: :restrict_with_error

    validates :name, presence: true, uniqueness: true
end
