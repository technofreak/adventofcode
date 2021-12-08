#!/usr/bin/env ruby

filename = "./input.txt"
previous = 0
count = 0
File.readlines(filename).each do |line|
  count += 1 if previous > 0 && previous < line.to_i
  previous = line.to_i
end

puts "number of times a depth measurement increases: #{count}"
