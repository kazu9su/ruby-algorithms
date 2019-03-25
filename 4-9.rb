# frozen_string_literal: true

require './btree_node.rb'
require './linked_list.rb'

def weave_lists(first, second, results, prefix)
  if first.size == 0 || second.size == 0
    tmp = Marshal.dump(prefix)
    result = Marshal.load(tmp)
    result.add_all(first)
    result.add_all(second)
    results << result
    return
  end
  first_head = first.delete_first
  prefix.add(first_head.value)
  weave_lists(first, second, results, prefix)
  first.add_first(first_head.value)
  prefix.delete_last

  second_head = second.delete_first
  prefix.add(second_head.value)
  weave_lists(first, second, results, prefix)
  second.add_first(second_head.value)
  prefix.delete_last
end

def all_sequence(node)
  return [LinkedList.new] if node.nil?

  results = []
  prefix = LinkedList.new
  prefix.add(node.value)
  left_sequence = all_sequence(node.left)
  right_sequence = all_sequence(node.right)

  left_sequence.each do |left|
    right_sequence.each do |right|
      weaved = []
      weave_lists(left, right, weaved, prefix)
      results += weaved
    end
  end

  results
end

root = BtreeNode.new(50)
root.left = BtreeNode.new(20)
root.right = BtreeNode.new(60)

p all_sequence(root)

class Foo
  attr_accessor :foo

  def initialize
    @foo = 1
  end
end

array = [Foo.new]
copy = array.clone
array[0].foo = 2
