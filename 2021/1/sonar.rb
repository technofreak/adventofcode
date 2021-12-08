#!/usr/bin/env ruby

filename = "./input.txt"

def part_one(filename)
  previous = 0
  count = 0

  File.readlines(filename).each do |line|
    count += 1 if previous > 0 && previous < line.to_i
    previous = line.to_i
  end

  puts "number of times a depth measurement increases: #{count}"
end

def part_two(filename)
  nos = File.readlines(filename).map(&:to_i)
  count = 0
  nos.each_with_index do |n, i|
    break if i+3 > nos.size
    current = nos[i, 3].sum
    further = nos[i+1, 3].sum
    count += 1 if further > current
  end

  puts "nomber of times sum is larger than previous sum: #{count}"
end

part_two(filename)