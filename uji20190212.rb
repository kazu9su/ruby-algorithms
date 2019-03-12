# frozen_string_literal: true

input = "(f x) (g) (h y) (i))"

def hoge(input)
  input = input.gsub(/\s/, '')
  strings = input.split('')

  ary = []
  for i in 0..(strings.size - 1) do
    case strings[i]
    when '('
      ary << []
    when ')'
      next if ary.size == 1
      last = ary.pop
      n_last = ary.pop
      hako = [last[0], n_last]
      hako << last[1] unless last[1].nil?
      ary << hako
    else
      queue = ary.pop
      queue << strings[i]
      ary << queue
    end
  end

  p ary #=> [["i", ["h", ["g", ["f", "x"]], "y"]]]
end

hoge(input)
