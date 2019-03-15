# frozen_string_literal: true

=begin
A letter can be encoded to a number in the following way:

'A' -> '1', 'B' -> '2', 'C' -> '3', ..., 'Z' -> '26'
A message is a string of uppercase letters, and it is encoded first using this scheme. For example, 'AZB' -> '1262'

Given a string of digits S from 0-9 representing an encoded message, return the number of ways to decode it.
=end

def decode_variations(s)
  dp = Array.new(s.size + 1, 0)
  dp[s.size + 1] = 1
  for i in (0..s.size).reverse_each
    if s[i] == '0'
      dp[i] = 0
    else
      dp[i] = dp[i+1]
      next if i >= s.size - 1
      if s[i] == '1'
        dp[i] += dp[i+2]
      elsif s[i] == '2'
        if s[i+1] < '7'
          dp[i] += dp[i+2]
        end
      end
    end
  end

    dp[0]
end

=begin
[0,0,0,0,1]
[0,0,0,1,1]
[0,0,1,1,1]
[0,2,1,1,1]
[3,2,1,1,1]
=end

p decode_variations('1262')
p decode_variations('1202')
