class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  #def should_generate_new_friendly_id?
  #  new_record?
  #end
  
  #mount_uploader :image, ImageUploader
  
  has_many :comments
  
  attr_accessible :description, :ingredients, :instructions, :name, :image, :remote_image_url
  
  validates :name, :ingredients, :instructions, presence: true
  
  def as_json(options = {})
    super(only: [:instructions, :name], include: [:comments])
  end
  
  def previous
    Recipe.find_by_id(id - 1)
  end
  
  def next
    Recipe.find_by_id(id + 1)
  end
end
