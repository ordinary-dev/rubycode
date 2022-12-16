# @param {Integer} num
# @return {String}
def int_to_roman(num)
  res = ''

  if num >= 1000
    res += 'M' * (num / 1000)
    num %= 1000
  end

  if num >= 100
    res += to_roman(num / 100, 'C', 'D', 'M')
    num %= 100
  end

  if num >= 10
    res += to_roman(num / 10, 'X', 'L', 'C')
    num %= 10
  end

  res + to_roman(num, 'I', 'V', 'X')
end

def to_roman(num, one, five, ten)
  return one * num if num <= 3

  return one + five if num == 4

  return five + one * (num - 5) if num <= 8

  one + ten
end
