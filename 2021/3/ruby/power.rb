#!/usr/bn/env ruby

def get_inputs
  File.readlines('./input.txt').map(&:strip)
end

def gamma(cnt)
  bits = cnt.map{|zeroes, ones| zeroes > ones ? '0' : '1' }.join('')
  gamma = bin_to_dec(bits)
  puts "gamma: #{gamma}"
  gamma
end

def epsilon(cnt)
  bits = cnt.map{|zeroes, ones| zeroes > ones ? '1' : '0' }.join('')
  epsilon = bin_to_dec(bits)
  puts "epsilon: #{epsilon}"
  epsilon
end

def bin_to_dec(str)
  str.reverse.chars.map.with_index do |digit, ix|
    digit.to_i * 2**ix
  end.sum
end

def counts
  inputs = get_inputs
  len = inputs.first.size
  bits = (0..len-1).map{|n| inputs.map{|i| i[n].to_i } }
  (0..len-1).map{|n| [bits[n].count(0), bits[n].count(1)] }
end

def power
  cnt = counts
  gamma(cnt) * epsilon(cnt)
end

puts "power: #{power}"

def countn(n, inputs)
  len = inputs.first.size
  bits = inputs.map{|i| i[n].to_i }
  [bits.count(0), bits.count(1)]
end

def life_support_rating
  ogr = get_inputs
  (0..ogr.first.size-1).each do |n|
    zeroes, ones = countn(n, ogr)
    most = zeroes > ones ? 0 : 1
    if ogr.size > 1
      ogr = ogr.select{|x| x.chars[n].to_i == most }
    end
  end
  cgr = get_inputs
  (0..cgr.first.size-1).each do |n|
    zeroes, ones = countn(n, cgr)
    least = zeroes > ones ? 1 : 0
    if cgr.size > 1
      cgr = cgr.select{|x| x.chars[n].to_i == least }
    end
  end
  bin_to_dec(ogr.last) * bin_to_dec(cgr.last)
end

puts "life support rating: #{life_support_rating}"
