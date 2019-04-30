# frozen_string_literal: true

=begin
Island Count
Given a 2D array binaryMatrix of 0s and 1s, implement a function getNumberOfIslands that returns the number of islands of 1s in binaryMatrix.

An island is defined as a group of adjacent values that are all 1s. A cell in binaryMatrix is considered adjacent to another cell if they are next to each either on the same row or column. Note that two values of 1 are not part of the same island if they’re sharing only a mutual “corner” (i.e. they are diagonally neighbors).

Explain and code the most efficient solution possible and analyze its time and space complexities.
=end

def get_number_of_islands(binaryMatrix)
  count = 0
  for row in 0..binaryMatrix.size-1
    for col in 0..binaryMatrix[0].size-1
      next if binaryMatrix[row][col] == 0

      queue = []
      queue << [row, col]
      while !queue.empty?
        i, j = queue.pop
        queue << [i, j+1] if j < binaryMatrix[0].size-1 && binaryMatrix[i][j+1] == 1 # right
        queue << [i+1, j] if i < binaryMatrix.size-1 && binaryMatrix[i+1][j] == 1 # below
        queue << [i-1, j] if i > 0 && binaryMatrix[i-1][j] == 1 # top
        queue << [i, j-1] if j > 0 && binaryMatrix[i][j-1] == 1 # left
        binaryMatrix[i][j] = 0
      end

      count += 1
    end
  end

  count
end

binaryMatrix = [ [0,    1,    0,    1,    0],
                 [0,    0,    1,    1,    1],
                 [1,    0,    0,    1,    0],
                 [0,    1,    1,    0,    0],
                 [1,    0,    1,    0,    1] ]

p get_number_of_islands(binaryMatrix)
