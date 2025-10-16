class Project < ApplicationRecord
  validates :title, :slug, presence: true
  belongs_to :project_type

  has_many :views, dependent: :destroy

  scope :featured, -> { where(featured: true) }
  scope :not_featured, -> { where(featured: false) }

  scope :featured_and_published, -> { where(featured: true, published: true) }
  scope :not_featured_and_published, -> { where(featured: false, published: true) }

  def to_param
    slug.presence || id.to_s
  end

  def type
    project_type&.name
  end
end
