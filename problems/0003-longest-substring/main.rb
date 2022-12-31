# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # Create a hash map to save
  # the position of every symbol
  indexes = Hash.new(-1)

  # Start and end of the current sequence s[i...j]
  i = 0
  j = 0

  # Result will be stored here
  maxlen = 0

  while i < s.length
    # While we haven't reached the end of the string
    # and haven't seen current character before
    while j < s.length && indexes[s[j]] == -1
      # Save character's position
      indexes[s[j]] = j
      # Move to the next character
      j += 1
    end

    # We just reached the end of the string
    # and we will never find a longer substring.
    return [maxlen, j - i].max if j == s.length

    # It's not the end of the string,
    # repeated character found.
    # Save max length and set "i"
    # to the character right after the first repeated.
    maxlen = [maxlen, j - i].max
    new_i = indexes[s[j]] + 1
    while i != new_i
      indexes[s[i]] = -1
      i += 1
    end
    indexes[s[j]] = j
    j += 1
  end

  maxlen
end
