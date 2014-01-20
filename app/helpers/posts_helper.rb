module PostsHelper
  include ActsAsTaggableOn::TagsHelper
  
  def month_convert mnth
    case mnth
    	when "January" 		then '01'
    	when "February" 	then '02'
    	when "March" 		then '03'
    	when "April" 		then '04'
    	when "May" 			then '05'
    	when "June" 		then '06'
    	when "July" 		then '07'
    	when "August" 		then '08'
    	when "September" 	then '09'
    	when "October" 		then '10'
    	when "November" 	then '11'
    	when "December" 	then '12'
  	end
  end
  
  def day_help m
    case m
	  when '04','06','09','11' 		          then '30'
	  when '01','03','05','07','08','10','12' then '31'
	  else 
	    '30'
	end
  end
  
  def topic_name t
    t.topic.nil? ? "" : Topic.find_by_id(t.topic).name
  end
end
