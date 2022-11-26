# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  # Find min length
  min_length = strs.map{|s| s.length}.min()
  
  res = ""
  for i in 0..min_length - 1 do
    strs.each do |st|
      # If characters doesn't match
      if st[i] != strs[0][i]
        return res
      end
    end
   
    # All characters match
    res += strs[0][i]
  end

  return res
end
