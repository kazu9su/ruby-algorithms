# frozen_string_literal: true

def get_diff_between_two_strings_2(source, target)
  dp = Array.new(source.size + 1) { Array.new(target.size + 1, 0) }
  res = Array.new(source.size + 1) { Array.new(target.size + 1) }

  res[0][0] = ''
  for i in 1..source.size
    dp[i][0] = i
    res[i][0] = res[i-1][0] + " -#{source[i-1]}"
  end

  for j in 1..target.size
    dp[0][j] = j
    res[0][j] = res[0][j-1] + " +#{target[j-1]}"
  end

  for i in 1..source.size
    for j in 1..target.size
      if source[i-1] == target[j-1]
        dp[i][j] = dp[i-1][j-1]
        res[i][j] = res[i-1][j-1] + " #{source[i-1]}"
      elsif dp[i-1][j] < dp[i][j-1]
        dp[i][j] = dp[i-1][j]
        res[i][j] = res[i-1][j] + " -#{source[i-1]}"
      else
        dp[i][j] = dp[i][j-1]
        res[i][j] = res[i][j-1] + " +#{target[j-1]}"
      end
    end
  end

  res[i][j]
end

x = 'ABCDEFG'
y = 'ABDFFGH'
p get_diff_between_two_strings_2(x, y)
