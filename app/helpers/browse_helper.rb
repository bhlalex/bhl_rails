module BrowseHelper
  def get_prefixes_of_results(list)
    arr = []
    list.each do |item|
      arr << item.value[0,1]
    end   
    arr.uniq.sort
  end
  def filter_list_by_prefix(wordslist, prefix)
    list = []
    out = false 
    wordslist.each do |item|        
      if (item.value[0,1].downcase == prefix.downcase)
        list << {:name => item.value, :count => item.hits}
        out = true 
      elsif (out)
        break
      end  
    end
    list
  end
end