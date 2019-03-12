# frozen_string_literal: true

require './linked_list_node.rb'

class LinkedList
  attr_accessor :next, :first, :size

  def add(val)
    if first.nil?
      @first = LinkedListNode.new(val)
      @size = 1
    else
      current = first
      while !current.next.nil?
        current = current.next
        @size += 1
      end

      node = LinkedListNode.new(val)
      current.next = node
    end
  end

  def delete(val)
    return false if first.nil?

    if (first.val == val)
      first = first.next
      return true
    end

    current = first
    while !current.nil?
      return false if current.next.nil?

      if (current.next.val == val)
        current.next = current.next.next
        return true
      end

      current = current.next
    end

    false
  end

  def to_a
    return [] if first.nil?
    result = []
    current = first

    while !current.nil?
      result << current
      current = current.next
    end

    result
  end
end
