# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x.negative?

  copy = x
  inv = 0

  while copy.positive?
    inv = inv * 10 + copy % 10
    copy /= 10
  end

  inv == x
end
