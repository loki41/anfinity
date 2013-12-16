class Post < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :title, :content, :category, :slug, :tag_list, :topic, :meta_title, :meta_description, :meta_keywords, :created_at
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  acts_as_ordered_taggable
  
  def self.by_year(year)
    where("created_at >= ? and created_at <= ?", "#{year}-01-01", "#{year}-12-31")
  end
  
  def self.by_month(year, month)
    where("created_at >= ? and created_at <= ?", "#{year}-#{month}-01", "#{year}-#{month}-31")
  end
end
