class Project < ApplicationRecord
  validates :title, :slug, presence: true
  has_one_attached :hero_image

  scope :featured, -> { where(featured: true) }
  scope :not_featured, -> { where(featured: false) }

  scope :featured_and_published, -> { where(featured: true, published: true) }
  scope :not_featured_and_published, -> { where(featured: false, published: true) }

  def to_param
    slug.presence || id.to_s
  end
end
