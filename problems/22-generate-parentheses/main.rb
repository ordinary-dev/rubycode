# Naive bruteforce solution

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  combinations = ['(']

  # Generate an array of all possible combinations
  (2..n * 2).each do |i|
    new_iteration = []

    combinations.each do |elem|
      new_iteration.push("#{elem})")
      # Opening bracket can't be the last one
      new_iteration.push("#{elem}(") if i != n * 2
    end

    combinations = new_iteration
  end

  # Return only valid combinations
  combinations.select { |l| parenthesis_valid?(l) }
end

def parenthesis_valid?(s)
  open_brackets = 0

  s.each_char do |char|
    if char == '('
      open_brackets += 1
    else
      open_brackets -= 1
    end
    return false if open_brackets.negative?
  end

  return false if open_brackets.positive?

  true
end
