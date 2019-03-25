# frozen_string_literal: true

a, b = 'str', 'str'
def a.greet
  puts "I am the object #{self.object_id}"
end
a.greet
b.greet
