# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  min_length = strs.map(&:length).min

  res = ''
  (0...min_length).each do |i|
    # Compare characters
    strs.each do |st|
      return res if st[i] != strs[0][i]
    end

    # All characters match
    res += strs[0][i]
  end

  res
end
