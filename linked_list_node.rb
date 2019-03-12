# frozen_string_literal: true

class LinkedListNode
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end
