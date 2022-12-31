require_relative 'main'
require 'test/unit'

class TestLCP < Test::Unit::TestCase
  def test_simple
    assert_equal('fl', longest_common_prefix(%w[flower flow flight]))
  end

  def test_empty_prefix
    assert_equal('', longest_common_prefix(%w[dog racecar car]))
  end

  def test_empty_string
    assert_equal('', longest_common_prefix(['']))
  end
end
