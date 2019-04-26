# frozen_string_literal: true

def get_perms(remainder)
  len = remainder.size
  result = []

  if len == 0
    result << ''
    return result
  end

  for i in 0..len-1
    before = i == 0 ? '' : remainder[0..i-1]
    after = remainder[i+1..len]
    partials = get_perms(before + after)
    partials.each do |s|
      result << remainder[i] + s
    end
  end

  result
end

p get_perms('ab')
