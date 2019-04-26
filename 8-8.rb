# frozen_string_literal: true

def build_freq_table(s)
  map = {}
  for i in 0..s.size-1
    c = s[i]
    map[c] = 0 unless map.key?(c)

    map[c] += 1
  end

  map
end

def print_perms(s)
  result = []
  map = build_freq_table(s)
  print_perms_helper(map, '', s.size, result)

  result
end

def print_perms_helper(map, prefix, remaining, result)
  if remaining == 0
    result << prefix
    return
  end

  map.each do |c, count|
    if count > 0
      map[c] -= 1
      print_perms_helper(map, prefix + c, remaining - 1, result)
      map[c] = count
    end
  end
end

p print_perms('aabbbbc')
