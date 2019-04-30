# frozen_string_literal: true

def decode_variations(s)
  dp = Array.new(s.size+1, 1)

  for i in 1..s.size
    if s[i-1] == '0'
      dp[i] = 0
    else
      dp[i] = dp[i-1]
      next if i == 1
      if s[i-2] == '1'
        dp[i] += dp[i-2]
      elsif s[i-2] == '2' && s[i-1] < '7'
        dp[i] += dp[i-2]
      end
    end
  end

  dp[i]
end

s = '1262'
p decode_variations(s)
