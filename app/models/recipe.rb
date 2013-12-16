class Recipe < ActiveRecord::Base
  default_scope order('created_at DESC')
  #mount_uploader :image, ImageUploader
  
  has_many :comments
  
  attr_accessible :description, :ingredients, :instructions, :name, :image, :remote_image_url, :prep, :cooking, 
				  :level, :serves, :tips, :additional_info, :slug, :meta_title, :meta_description, :meta_keywords
  
  validates :name, :ingredients, :instructions, presence: true
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
