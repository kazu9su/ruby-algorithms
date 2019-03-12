# frozen_string_literal: true

require './linked_list.rb'
require './btree_node.rb'

def create_linked_lists(root)
  return nil if root.nil?
  result = []
  list = LinkedList.new
  list.add(root.value)
  result << list
  queue = []
  queue << [root]

  while !queue.nil?
    current_nodes = queue.pop
    break if current_nodes.nil?
    next_nodes = []
    list = nil
    current_nodes.each do |node|
      node.children.each do |c|
        list = LinkedList.new if list.nil?
        next_nodes << c
        list.add(c.value)
      end
    end
    result << list unless list.nil?
    queue << next_nodes unless next_nodes.empty?
  end

  result
end

root = BtreeNode.new(10)
root.left = BtreeNode.new(4)
root.left.left = BtreeNode.new(3)
root.left.right = BtreeNode.new(2)
root.right = BtreeNode.new(5)
root.right.left = BtreeNode.new(6)
root.right.right = BtreeNode.new(7)
lists = create_linked_lists(root)

lists.each do |list|
  result = []
  list.to_a.each do |node|
    result << node.value
  end
  p result
end
