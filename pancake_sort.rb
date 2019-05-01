# frozen_string_literal: true

=begin
Pancake Sort
Given an array of integers arr:

Write a function flip(arr, k) that reverses the order of the first k elements in the array arr.
Write a function pancakeSort(arr) that sorts and returns the input array. You are allowed to use only the function flip you wrote in the first step in order to make changes in the array.
Example:

input:  arr = [1, 5, 4, 3, 2]

output: [1, 2, 3, 4, 5] # to clarify, this is pancakeSort's output

5 1 4 3 2
2 3 4 1 5
4 3 2 1 5
1 2 3 4 5

=end

def pancake_sort(arr)
  pancake_sort_helper(arr, arr.size-1)
  arr
end

def pancake_sort_helper(arr, limit)
  return if limit == 0
  max_i = 0
  for i in 1..limit
    max_i = i if arr[max_i] < arr[i]
  end
  flip(arr, max_i)
  flip(arr, limit)
  pancake_sort_helper(arr, limit-1)
end

def flip(arr, k)
  for i in 0..(k / 2)
    tmp = arr[i]
    arr[i] = arr[k-i]
    arr[k-i] = tmp
  end
end

def pancake_sort(arr)
  for i in (1..arr.size-1).reverse_each
    ans = find_max_i(arr, i)
    flip(arr, ans)
    flip(arr, i)
  end

  arr
end

def find_max_i(arr, last)
  ans = 0
  for i in 0..last
    ans = i if arr[ans] < arr[i]
  end

  ans
end

arr = [1, 5, 4, 3, 2]
p pancake_sort(arr)
