class Project < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :name, :category, :customer, :description, :feature_image, :tech, :duration, :features, :site_link, :slug, :show, :meta_title,
					:meta_description, :meta_keywords

  extend FriendlyId
  friendly_id :name, use: :slugged
end