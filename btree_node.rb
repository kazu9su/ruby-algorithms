# frozen_string_literal: true

class BtreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def children
    result = []
    result << left unless left.nil?
    result << right unless right.nil?

    result
  end
end
