require_relative 'main'
require 'test/unit'

class TestTwoSum < Test::Unit::TestCase
  def test_simple
    assert_equal([0, 1], two_sum([2, 7, 11, 15], 9))
    assert_equal([1, 2], two_sum([3, 2, 4], 6))
  end

  def test_execution_time
    assert_equal([9_998, 9_999], two_sum(Array(1..10_000), 19_999))
  end
end
