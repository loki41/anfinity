class Inquiry
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActionView::Helpers::TextHelper
  
  attr_accessor :name, :email, :message, :nickname
  
  validates :name, 
            :presence => true
  
  validates :email,
            :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  
  validates :message,
            :length => { :minimum => 10, :maximum => 1000 }
            
  validates :nickname, 
            :format => { :with => /\A\Z/ }
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def deliver
    return false unless valid?
    Pony.mail({
      :from => %("#{name}" <#{email}>),
      :reply_to => email,
      :subject => "Anfinity inquiry",
      :body => message,
      :html_body => simple_format(message)
    })
  end
      
  def persisted?
    false
  end
end