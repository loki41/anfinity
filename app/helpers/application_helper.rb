module ApplicationHelper
  
  def list_this val
    list = val.split(',')
    content_tag :ul do
        list.collect { |item| concat( content_tag(:li, item) ) }
    end  
  end
  
end
