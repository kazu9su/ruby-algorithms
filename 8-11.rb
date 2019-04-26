# frozen_string_literal: true

def find_ways(amount)
  coins = [25, 10, 5, 1]
  map = Array.new(amount + 1) { Array.new(coins.size + 1, 0) }
  find_ways_helper(amount, coins, 0, map)
end

def find_ways_helper(amount, coins, index, map)
  return map[amount][index] if map[amount][index] > 0
  return 1 if index >= coins.size - 1

  i = 0
  ways = 0
  while coins[index] * i <= amount
    remaining_amount = amount - coins[index] * i
    ways += find_ways_helper(remaining_amount, coins, index + 1, map)
    i += 1
  end

  map[amount][index] = ways
  ways
end

amount = 100
p find_ways(amount)
