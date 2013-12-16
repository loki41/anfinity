module PostsHelper
  def month_convert mnth
    case mnth
    	when "Janurary" 	then '01'
    	when "Feburary" 	then '02'
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
end
