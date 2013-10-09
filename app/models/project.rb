class Project < ActiveRecord::Base
  attr_accessible :name, :category, :customer, :description, :feature_image, :tech, :duration, :features, :site_link
end