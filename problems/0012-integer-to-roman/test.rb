require_relative 'main'
require 'test/unit'

class TestIntegerToRoman < Test::Unit::TestCase
  def test_simple_integer
    assert_equal('III', int_to_roman(3))
  end

  def test_complex_integer
    assert_equal('LVIII', int_to_roman(58))
  end

  def test_substaction
    assert_equal('MCMXCIV', int_to_roman(1994))
  end

  def test_smallest_number
    assert_equal('I', int_to_roman(1))
  end

  def test_largest_number
    assert_equal('MMMCMXCIX', int_to_roman(3999))
  end
end
