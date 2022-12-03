require_relative 'main'
require 'test/unit'

class TestStringToInt < Test::Unit::TestCase
  def test_simple_string
    assert_equal(42, my_atoi('42'))
  end

  def test_spaces
    assert_equal(-42, my_atoi('   -42'))
  end

  def test_words_after_number
    assert_equal(4193, my_atoi('4193 with words'))
  end

  def test_zeros
    assert_equal(32, my_atoi('0032'))
  end

  def test_max_int
    assert_equal(2_147_483_647, my_atoi('2147483648'))
  end

  def test_min_int
    assert_equal(-2_147_483_648, my_atoi('-2147483649'))
  end

  def test_invalid_string
    assert_equal(0, my_atoi('words and 987'))
  end

  def test_garbage_after_number
    assert_equal(3, my_atoi('3.14748'))
  end

  def test_multiple_signs
    assert_equal(0, my_atoi('+-12'))
  end

  def test_sign_after_number
    assert_equal(0, my_atoi('00000-42a1234'))
  end

  def test_minus_after_negative_number
    assert_equal(-5, my_atoi('-5-'))
  end

  def test_space_after_sign
    assert_equal(0, my_atoi('   +   413'))
  end
end
