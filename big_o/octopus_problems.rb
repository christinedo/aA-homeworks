## A Very Hungry Octopus wants to eat the longest fish in an array of fish.
fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths
# to all other fish lengths
def sluggish_octopus(fish_array)
  fish_array.each_index do |i|
    longest_fish = true
    ((i + 1)...fish_array.length).each do |j|
      if fish_array[j].length > fish_array[i].length
        longest_fish = false
      end
    end
    return fish_array[i] if longest_fish
  end
end

# Dominant Octopus
# Find the longest fish in O(n log n) time.
def dominant_octopus(fish_array)
  merge_sort(fish_array).first
end

def merge_sort(array)
  return array if array.length == 0 || array.length == 1

  middle = array.length / 2
  first_half = array[0...middle]
  second_half = array[middle...array.length]

  merge(merge_sort(first_half), merge_sort(second_half))
end

def merge(a, b = nil)
  return a if b.nil?

  merged = []
  a_idx = 0
  b_idx = 0
  a_end = a.length - 1
  b_end = b.length - 1

  until a_idx > a_end || b_idx > b_end
    if a[a_idx].length > b[b_idx].length
      merged << a[a_idx]
      a_idx += 1
    else
      merged << b[b_idx]
      b_idx += 1
    end
  end

  a_idx >= b_idx ? merged.concat(b[b_idx..b_end]) : merged.concat(a[a_idx..a_end])

  merged
end

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest
# fish that you have found so far while stepping through the array only once.
def clever_octopus(fish_array)
  longest_fish = fish_array[0]

  fish_array.each do |fish|
    if fish.length > longest_fish.length
      longest_fish = fish
    end
  end

  longest_fish
end

puts "sluggish: #{sluggish_octopus(fishes)}"
puts "dominant: #{dominant_octopus(fishes)}"
puts "clever:   #{clever_octopus(fishes)}"

## Dancing Octopus
# The game has tiles in the following directions:
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle
# number (tile index) the octopus must move. This should take O(n) time.
def slow_dance(dance_move, tiles)
  tiles.each_with_index do |tile, i|
    if tile == dance_move
      return i
    end
  end
end

puts slow_dance("up", tiles_array) # => 0
puts slow_dance("right-down", tiles_array) # => 3

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so that
# you can access the tentacle number in O(1) time.
tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def constant_dance(dance_move, tiles)
  tiles[dance_move]
end

puts constant_dance("up", tiles_hash) # => 0
puts constant_dance("right-down", tiles_hash) # => 3
