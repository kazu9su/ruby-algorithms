# frozen_string_literal: true

def validate_bst(node)
  validate_bst_helper(node, nil, nil)
end

def validate_bst_helper(node, min, max)
  return true if node.nil?

  if (!min.nil? && min > node.value) || (!max.nil? && max <= node.value)
    return false
  end

  if !validate_bst_helper(node.left, min, node.value) || !validate_bst_helper(node.right, node.value, max)
    return false
  end

  true
end
