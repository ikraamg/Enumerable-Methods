## Test for my_map
puts "\n\nTesting my_map:"
p (1..5).my_map(&:to_s) #=> Accepting symbols: converted to strings
p (1..4).my_map { |i| i * i } #=> [1, 4, 9, 16]
p (1..4).my_map { 'cat' } #=> ["cat", "cat", "cat", "cat"]

## Test for Inject via multiply_els method:
puts "\n\nTest for Inject via multiply_els method:"
puts multiply_els([2, 4, 5]) #=> 40

## Testing my_inject:

puts "\n\nTesting my_inject:"
# # Sum some numbers
puts (5..10).my_inject(:+) #=> 45
# #  Same using a block and my_inject
puts (5..10).my_inject { |sum, n| sum + n } #=> 45
# #  Multiply some numbers
puts (5..10).my_inject(1, :*) #=> 151200
# #  Same using a block
puts (5..10).my_inject(1) { |product, n| product * n } #=> 151200
# #  find the longest word
longest = %w[cat sheep bear].inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts longest #=> "sheep"

## Testing my_count?
puts "\n\nTesting my_count?: "

puts ary = [1, 2, 4, 2]
puts ary.my_count #=> 4
puts ary.my_count(2) #=> 2
puts ary.my_count(&:even?) #=> 3

## Testing .my_none?
puts "\n\nTesting my_none: "

puts %w[ant bear cat].my_none? { |word| word.length == 5 } #=> true
puts %w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
puts %w[ant bear cat].my_none?(/d/) #=> true
puts [1, 3.14, 42].my_none?(Float) #=> false
puts [].my_none? #=> true
puts [nil].my_none? #=> true
puts [nil, false].my_none? #=> true
puts [nil, false, true].my_none? #=> false

# #Testing .my_any?
puts "\n\nTesting my_any: "

puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
puts %w[ant bear cat].my_any?(/d/) #=> false
puts [nil, true, 99].my_any?(Integer) #=> true
puts [nil, true, 99].my_any? #=> true
puts [].my_any? #=> false

# #Testing .my_all?
puts "\n\nTesting my_all?: "

puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
puts %w[ant bear cat].my_all?(/t/) #=> false
puts [1, 2i, 3.14].my_all?(Numeric) #=> true
puts [nil, true, 99].my_all? #=> false
puts [].my_all?

## Testing select
puts "\n\nTesting my_select?: "

p (1..10).my_select { |i| i % 3 == 0 } #=> [3, 6, 9]

p [1, 2, 3, 4, 5].my_select(&:even?) #=> [2, 4]

p %i[foo bar].my_select { |x| x == :foo } #=> [:foo]

## Testing each with index
puts "\n\nTesting my_each_with_index?: "

[1, 2, 3, 4, 5].my_each_with_index do |x, i|
  print ",#{i}:"
  print x * 3
end
## => ,0:3,1:6,2:9,3:12,4:15

# #Testing each
puts "\n\nTesting my_each?: "
[1, 2, 3, 4, 5].my_each do |x|
  print x * 3
  print '**'
end
## => 3**6**9**12**15**
