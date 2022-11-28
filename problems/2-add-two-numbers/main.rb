require_relative 'types'

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  reminder = 0
  current = nil
  first_node = nil

  while !l1.nil? || !l2.nil? || reminder != 0
    # Read digits
    a = 0
    b = 0
    a = l1.val unless l1.nil?
    b = l2.val unless l2.nil?

    # Move pointers to the next node
    l1 = l1.next unless l1.nil?
    l2 = l2.next unless l2.nil?

    # Calculate the result
    digit = (a + b + reminder) % 10
    reminder = (a + b + reminder) / 10

    # Create the first node
    if current.nil?
      current = ListNode.new(digit)
      first_node = current
    # Create regular node
    else
      current.next = ListNode.new(digit)
      current = current.next
    end
  end

  first_node
end
