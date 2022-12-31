require_relative 'main'
require 'test/unit'

class TestRectangleArea < Test::Unit::TestCase
  def test_simple
    assert_equal(45, compute_area(-3, 0, 3, 4, 0, -1, 9, 2))
    assert_equal(16, compute_area(-2, -2, 2, 2, -2, -2, 2, 2))
  end
end
