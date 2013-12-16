module ApplicationHelper
  
  def list_this val
    list = val.split(',')
    content_tag :ul do
        list.collect { |item| concat( content_tag(:li, item) ) }
    end  
  end
  
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
  
  def active? c
    controller_name == c ? 'current' : 'none'
  end
end
