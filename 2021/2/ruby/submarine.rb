#! /usr/bin/env ruby

def get_inputs
 filename = './input.txt'
 File.readlines(filename)
end

def move(inputs)
  depth = hoz = 0
  inputs.each do |line|
    line = line.split(' ')
    cmd, units = line[0], line[1].to_i
    case cmd
    when 'forward'
      hoz += units
    when 'up'
      depth -= units
    when 'down'
      depth += units
    end
  end
  puts depth * hoz
end

def move_aim(inputs)
  depth = hoz = aim = 0
  inputs.each do |line|
    line = line.split(' ')
    cmd, units = line[0], line[1].to_i
    case cmd
    when 'forward'
      hoz += units
      depth += aim * units
    when 'up'
      aim -= units
    when 'down'
      aim += units
    end
  end
  puts depth * hoz
end

inputs = get_inputs
move(inputs)
move_aim(inputs)
