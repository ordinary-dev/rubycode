require_relative 'main'
require 'test/unit'

class TestIsPalindrome < Test::Unit::TestCase
  def test_palindrome
    assert_equal(true, is_palindrome(121))
  end

  def test_negative
    assert_equal(false, is_palindrome(-121))
  end

  def test_regular_number
    assert_equal(false, is_palindrome(10))
  end
end
