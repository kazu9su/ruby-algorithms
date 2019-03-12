# frozen_string_literal: true

list = [5, 3, 1, 4, 10, 8, 9]

def mergesort list
  if list.size == 1
    return list
  end

  list2 = list.pop(list.size >> 1)

  merge(mergesort(list), mergesort(list2))
end

def merge(list1, list2)
  lower1 = 0
  lower2 = 0
  upper1 = list1.size - 1
  upper2 = list2.size - 1
  new_list = []
  loop do
    if lower1 <= upper1 && (list2[lower2].nil? || list1[lower1] < list2[lower2])
      new_list << list1[lower1]
      lower1 += 1
      next
    end

    if lower2 <= upper2 && (list1[lower1].nil? || list1[lower1] > list2[lower2])
      new_list << list2[lower2]
      lower2 += 1
      next
    end

    break
  end

  new_list
end

p mergesort(list)
