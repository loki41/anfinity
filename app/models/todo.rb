class Todo < ActiveRecord::Base
  attr_accessible :name, :kind, :location, :status, :due
  default_scope order('created_at DESC')
end
