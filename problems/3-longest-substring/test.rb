require_relative 'main'
require 'test/unit'

class TestLengthOfLongestSubstring < Test::Unit::TestCase
  def test_regular_string
    assert_equal(3, length_of_longest_substring('abcabcbb'))
    assert_equal(3, length_of_longest_substring('pwwkew'))
    assert_equal(2, length_of_longest_substring('abba'))
  end

  def test_empty_string
    assert_equal(0, length_of_longest_substring(''))
  end

  def test_one_character
    assert_equal(1, length_of_longest_substring('a'))
  end

  def test_repeating_characters
    assert_equal(1, length_of_longest_substring('bbbbbb'))
  end

  def test_very_long_string
    assert_equal(86, length_of_longest_substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#&()*+/<=>?@[]^`{|}~ ' * 1000))
  end
end
