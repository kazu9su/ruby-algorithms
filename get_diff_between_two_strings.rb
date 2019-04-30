# frozen_string_literal: true

def get_diff_between_two_strings(source, target)
  memo = Array.new(source.size) { Array.new(target.size) }
  i = 0
  j = 0

  ans = []
  while i < source.size && j < target.size
    if source[i] == target[j]
      ans << "#{source[i]}"
      i += 1
      j += 1
    else
      if dp(i + 1, j, source, target, memo) <= dp(i, j + 1, source, target, memo)
        ans << "-#{source[i]}"
        i += 1
      else
        ans << "+#{target[j]}"
        j += 1
      end
    end
  end

  while i < source.size
    ans << "-#{source[i]}"
    i += 1
  end

  while j < target.size
    ans << "+#{target[j]}"
    j += 1
  end

  ans.join(' ')
end

def dp(i, j, source, target, memo)
  if i == source.size || j == target.size
    return source.size - i + target.size - j
  end

  if memo[i][j].nil?
    if source[i] == target[j]
      memo[i][j] = dp(i + 1, j + 1, source, target, memo)
    else
      memo[i][j] = [dp(i + 1, j, source, target, memo), dp(i, j + 1, source, target, memo)].min
    end
  end

  memo[i][j]
end
x = 'ABCDEFG'
y = 'ABDFFGH'

p get_diff_between_two_strings(x, y)
=begin
1. caluculate minimal pattern and memo it.
2. Then, compare it when decide the character to print
3. continue to do it
=end
