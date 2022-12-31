# @param {Character[][]} board
# @return {Void}
# Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  # Find all possible options for each cell.
  # Board may be modified.
  # This pre-check greatly reduces the number of values to iterate over.
  options = generate_options(board)

  # Remember numbers that are already present
  fixed_numbers = get_fixed_numbers(board)

  i = 0
  j = 0

  while i <= 8
    # Skip this cell
    if fixed_numbers[i][j]
      i, j = increment_indices(i, j)
      next
    end

    # This cell is not solved

    board[i][j] = options[i][j][0] if board[i][j] == '.'

    # Find first good digit
    while !cell_valid?(board, i, j) && options[i][j].include?(board[i][j])
      board[i][j] = next_digit(board[i][j], options[i][j])
    end

    # Error somewhere else
    if !options[i][j].include?(board[i][j])
      board[i][j] = '.'
      i, j = decrement_indices(i, j, fixed_numbers)
      board[i][j] = next_digit(board[i][j], options[i][j])
    # Looks good, move to the next cell
    else
      i, j = increment_indices(i, j)
    end
  end
end

# Returns a 3-dimensional array with all possible values for each cell.
# Returns an empty array for cells with numbers.
# If there is only one option, then this value is written on the board.
def generate_options(board)
  options = []

  board.each_with_index do |row, i|
    options.push([])
    row.each_with_index do |cell, j|
      options[i].push([])

      # Do not generate options for filled cells
      next unless cell == '.'

      # Find values from the corresponding row, column and square
      row = board[i]
      column = get_column(board, j)
      square = get_square(board, i, j)

      # Find options
      9.times do |x|
        char = (x + 1).to_s
        # Add number to options if doesn't repeat
        options[i][j].push(char) unless row.include?(char) || column.include?(char) || square.include?(char)
      end

      # Only one option exists
      if options[i][j].length == 1
        board[i][j] = options[i][j].first
        options[i][j] = []
      end
    end
  end

  options
end

# Returns 9x9 matrix with boolean values.
# Value is true if the corresponding number is already on the board.
def get_fixed_numbers(board)
  fixed = []
  board.each do |row|
    fixed.push([])
    row.each do |cell|
      fixed.last.push(cell != '.')
    end
  end
  fixed
end

# Returns the indices of the next cell
def increment_indices(i, j)
  return [i, j + 1] if j < 8

  [i + 1, 0]
end

# Returns the indices of the previous cell.
# Executes recursively until it finds a cell with no initial value.
def decrement_indices(i, j, fixed_numbers)
  if j.positive?
    j -= 1
  else
    j = 8
    i -= 1
  end

  return decrement_indices(i, j, fixed_numbers) if fixed_numbers[i][j]

  [i, j]
end

# Checks if this cell doesn't break the rules of sudoku
def cell_valid?(board, row_index, column_index)
  # Check row
  return false unless seq_valid?(board[row_index])
  # Check column
  return false unless seq_valid?(get_column(board, column_index))
  # Check square
  return false unless seq_valid?(get_square(board, row_index, column_index))

  # Everything is ok
  true
end

# Check if all values are unique (except for '.')
def seq_valid?(cells)
  values = []
  cells.each do |v|
    return false if values.include?(v)

    values.push(v) if v != '.'
  end
  true
end

def get_column(board, column_index)
  values = []
  board.each do |row|
    values.push(row[column_index])
  end
  values
end

def get_square(board, row_index, column_index)
  # Calculate square location
  a = row_index / 3 * 3
  b = column_index / 3 * 3

  # Get values
  values = []
  3.times do |x|
    3.times do |y|
      values.push(board[a + x][b + y])
    end
  end

  values
end

def next_digit(cell, options)
  index = options.find_index(cell)
  return cell.next if index + 1 == options.length

  options[index + 1]
end
