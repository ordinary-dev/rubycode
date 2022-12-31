require_relative 'main'
require 'test/unit'

class TestSudokuSolver < Test::Unit::TestCase
  def test_simple_sudoku
    input = [
      %w[5 3 . . 7 . . . .],
      %w[6 . . 1 9 5 . . .],
      %w[. 9 8 . . . . 6 .],
      %w[8 . . . 6 . . . 3],
      %w[4 . . 8 . 3 . . 1],
      %w[7 . . . 2 . . . 6],
      %w[. 6 . . . . 2 8 .],
      %w[. . . 4 1 9 . . 5],
      %w[. . . . 8 . . 7 9]
    ]
    output = [
      %w[5 3 4 6 7 8 9 1 2],
      %w[6 7 2 1 9 5 3 4 8],
      %w[1 9 8 3 4 2 5 6 7],
      %w[8 5 9 7 6 1 4 2 3],
      %w[4 2 6 8 5 3 7 9 1],
      %w[7 1 3 9 2 4 8 5 6],
      %w[9 6 1 5 3 7 2 8 4],
      %w[2 8 7 4 1 9 6 3 5],
      %w[3 4 5 2 8 6 1 7 9]
    ]
    solve_sudoku(input)
    assert_equal(output, input)
  end

  def test_hard_sudoku
    input = [
      %w[. . . . . 7 . . 9],
      %w[. 4 . . 8 1 2 . .],
      %w[. . . 9 . . . 1 .],
      %w[. . 5 3 . . . 7 2],
      %w[2 9 3 . . . . 5 .],
      %w[. . . . . 5 3 . .],
      %w[8 . . . 2 3 . . .],
      %w[7 . . . 5 . . 4 .],
      %w[5 3 1 . 7 . . . .]
    ]
    output = [
      %w[3 1 2 5 4 7 8 6 9],
      %w[9 4 7 6 8 1 2 3 5],
      %w[6 5 8 9 3 2 7 1 4],
      %w[1 8 5 3 6 4 9 7 2],
      %w[2 9 3 7 1 8 4 5 6],
      %w[4 7 6 2 9 5 3 8 1],
      %w[8 6 4 1 2 3 5 9 7],
      %w[7 2 9 8 5 6 1 4 3],
      %w[5 3 1 4 7 9 6 2 8]
    ]
    solve_sudoku(input)
    assert_equal(output, input)
  end
end
