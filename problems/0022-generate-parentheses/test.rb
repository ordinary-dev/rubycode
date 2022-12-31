require_relative 'main'
require 'test/unit'

class TestParenthesesGenerator < Test::Unit::TestCase
  def test_one_level
    res = generate_parenthesis(1)
    assert_equal(['()'], res)
  end

  def test_three_levels
    res = generate_parenthesis(3)
    out = %w[((())) (()()) (())() ()(()) ()()()]

    out.each do |p|
      assert(res.include?(p), "Missing: #{p}")
    end

    assert_equal(out.count, res.count)
  end

  def test_five_levels
    res = generate_parenthesis(5)
    out = %w[((((())))) (((()()))) (((())())) (((()))()) (((())))() ((()(()))) ((()()())) ((()())()) ((()()))() ((())(())) ((())()()) ((())())() ((()))(()) ((()))()() (()((()))) (()(()())) (()(())()) (()(()))() (()()(())) (()()()()) (()()())() (()())(()) (()())()() (())((())) (())(()()) (())(())() (())()(()) (())()()() ()(((()))) ()((()())) ()((())()) ()((()))() ()(()(())) ()(()()()) ()(()())() ()(())(()) ()(())()() ()()((())) ()()(()()) ()()(())() ()()()(()) ()()()()()]

    out.each do |p|
      assert(res.include?(p), "Missing: #{p}")
    end

    assert_equal(out.count, res.count)
  end
end
