# frozen_string_literal: true

def place_queens(columns, row, results)
  if row == 7
    results << columns.dup
  else
    for col in 0..7
      next unless valid?(columns, row, col)
      columns[row] = col
      place_queens(columns, row + 1, results)
    end
  end
end

def valid?(columns, row1, col1)
  for row2 in 0..row1-1
    col2 = columns[row2]

    return false if col1 == col2

    col_diff = (col1 - col2).abs
    row_diff = row1 - row2

    return false if col_diff == row_diff
  end

  true
end

columns = Array.new(8) { Array.new(8) }
results = []

place_queens(columns, 0, results)
p results.count
