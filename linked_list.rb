# frozen_string_literal: true

require './linked_list_node.rb'

class LinkedList
  attr_accessor :first, :size, :value

  def initialize
    @size = 0
  end

  def add(val)
    if first.nil?
      @first = LinkedListNode.new(val)
      @size = 1
    else
      current = first
      while !current.next.nil?
        current = current.next
      end

      node = LinkedListNode.new(val)
      @size += 1
      current.next = node
    end
  end

  def add_first(val)
    if first.nil?
      @first = LinkedListNode.new(val)
      @size = 1
    else
      tmp = @first
      @first = LinkedListNode.new(val)
      @first.next = tmp
      @size += 1
    end
  end

  def delete(val)
    return false if first.nil?

    if (first.val == val)
      first = first.next
      @size -= 1
      return true
    end

    current = first
    while !current.nil?
      return false if current.next.nil?

      @size -= 1
      if (current.next.val == val)
        current.next = current.next.next
        return true
      end

      current = current.next
    end

    false
  end

  def delete_first
    return nil if first.nil?

    @size -= 1
    tmp = first
    @first = first.next

    tmp
  end

  def delete_last
    return nil if first.nil?

    if first.next.nil?
      tmp = @first
      @first = nil
      return tmp
    end

    current = first
    while !current.next.nil?
      before = current
      current = current.next
    end

    result = current
    before.next = nil

    @size -= 1

    result
  end

  def add_all(linked_list)
    if first.nil?
      @first = node
      return
    end

   current = @first
    while !current.next.nil?
      current = current.next
    end
    current.next = linked_list.first
    @size += linked_list.size
  end
end
