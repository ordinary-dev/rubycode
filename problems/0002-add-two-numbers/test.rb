require_relative 'main'
require 'test/unit'

class TestAddTwoNumbers < Test::Unit::TestCase
  def test_case_1
    a3 = ListNode.new(3)
    a2 = ListNode.new(4, a3)
    a1 = ListNode.new(2, a2)

    b3 = ListNode.new(4)
    b2 = ListNode.new(6, b3)
    b1 = ListNode.new(5, b2)

    c = add_two_numbers(a1, b1)

    assert_equal(7, c.val)
    assert_equal(0, c.next.val)
    assert_equal(8, c.next.next.val)
  end
end
