# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  # Check rows
  return false unless sudoku_rows_valid?(board)

  # Check columns
  return false unless sudoku_columns_valid?(board)

  # Check sub-boxes
  return false unless sudoku_sub_boxes_valid?(board)

  true
end

def sudoku_rows_valid?(board)
  board.each do |row|
    digits = []
    row.each do |cell|
      return false if digits.include?(cell)

      digits.push(cell) if cell != '.'
    end
  end

  true
end

def sudoku_columns_valid?(board)
  9.times do |i|
    digits = []
    board.each do |row|
      cell = row[i]
      return false if digits.include?(cell)

      digits.push(cell) if cell != '.'
    end
  end

  true
end

def sudoku_sub_boxes_valid?(board)
  3.times do |i|
    # Select 3 rows
    rows = board[i * 3..i * 3 + 2]

    3.times do |j|
      digits = []
      rows.each do |row|
        # Select 3 columns
        cols = row[j * 3..j * 3 + 2]
        cols.each do |cell|
          return false if digits.include?(cell)

          digits.push(cell) if cell != '.'
        end
      end
    end
  end

  true
end
