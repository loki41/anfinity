class Todo < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :name, :kind, :location, :status, :due
end
