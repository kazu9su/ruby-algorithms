# frozen_string_literal: true

def quicksort(bottom, top, data)
  return if (bottom >= top)

  upper = top
  div = data[bottom]

  for lower in bottom..top do
    while lower <= upper && data[lower] <= div do
      lower += 1
    end

    while lower <= upper && data[upper] > div do
      upper -= 1
    end

    if lower < upper
      tmp = data[lower]
      data[lower] = data[upper]
      data[upper] = tmp
    end
  end

  tmp = data[bottom]
  data[bottom] = data[upper]
  data[upper] = tmp

  quicksort(bottom, upper - 1, data)
  quicksort(upper + 1, top, data)
end

ary = [4, 3, 1, 2, 5, 10, 12, 9]
quicksort(0, ary.size - 1, ary)

p ary
