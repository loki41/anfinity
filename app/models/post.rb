class Post < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :title, :content, :category, :slug, :tag_list, :topic, :meta_title, :meta_description, :meta_keywords
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  acts_as_ordered_taggable
end
