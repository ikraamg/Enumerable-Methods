# rubocop: disable Metrics/ModuleLength

module Enumerable
  def my_each
    return to_enum unless block_given?

    i = 0
    while i <= size - 1
      yield(to_a[i])
      i += 1
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    while i <= size - 1
      yield(to_a[i], i)
      i += 1
    end
  end

  def my_select
    return to_enum unless block_given?

    output_arr = []
    my_each do |val|
      output_arr.push(val) if yield(val)
    end
    output_arr
  end

  # rubocop: disable Style/CaseEquality
  def my_all?(arg = nil)
    all_matched = true
    my_each do |val|
      if block_given?
        all_matched = false unless yield(val)
      elsif arg.nil?
        all_matched = false unless val
      else
        all_matched = false unless arg === val
      end
    end
    all_matched
  end

  # rubocop: disable Style/IfInsideElse

  def my_any?(arg = nil)
    any_matched = false
    my_each do |val|
      if block_given?
        any_matched = true if yield(val)
      elsif arg.nil?
        any_matched = true if val
      else
        any_matched = true if arg === val
      end
    end
    any_matched
  end

  def my_none?(arg = nil)
    none_matched = true
    my_each do |val|
      if block_given?
        none_matched = false if yield(val)
      elsif arg.nil?
        none_matched = false if val
      else
        none_matched = false if arg === val
      end
    end
    none_matched
  end

  # rubocop: enable Style/CaseEquality, Style/IfInsideElse
  def my_count(arg = nil)
    count = 0
    if block_given?
      my_each do |val|
        count += 1 if yield(val)
      end
      count
    elsif arg.nil?
      length
    else
      my_each do |val|
        count += 1 if val == arg
      end
      count
    end
  end

  def my_map
    return to_enum unless block_given?

    output_arr = []
    my_each do |val|
      output_arr.push(yield(val))
    end
    output_arr
  end

  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def my_inject(arg1 = nil, arg2 = nil)
    if block_given?
      my_each do |item|
        arg1 = arg1.nil? ? to_a[0] : yield(arg1, item)
      end
      arg1

    elsif arg1.nil? == false
      i = arg2.nil? ? 1 : 0
      total = arg2.nil? ? to_a[0] : arg1
      operator = arg2.nil? ? arg1 : arg2

      while i < size
        total = to_a[i].send(operator, total)
        i += 1
      end
      total
    else
      to_enum
    end
  end
end

# rubocop: enable Metrics/ModuleLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

def multiply_els(arr)
  arr.my_inject { |total, val| total * val }
end

puts multiply_els([2, 4, 5]) #=> 40

# # Testing inject
# puts 'Original: '
# # Sum some numbers
# puts (5..10).inject('+') #=> 45
# # Same using a block and inject
# puts (5..10).inject { |sum, n| sum + n } #=> 45
# # Multiply some numbers
# puts (5..10).inject(1, :*) #=> 151200
# # Same using a block
# puts (5..10).inject(1) { |product, n| product * n } #=> 151200
# # find the longest word
# longest = %w[cat sheep bear].inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# puts longest #=> "sheep"

# puts "\n\nNow Mine: "
# # # Sum some numbers
# puts (5..10).my_inject(:+) #=> 45
# # # # Same using a block and my_inject
# puts (5..10).my_inject { |sum, n| sum + n } #=> 45
# # # # Multiply some numbers
# puts (5..10).my_inject(1, :*) #=> 151200
# # # # Same using a block
# puts (5..10).my_inject(1) { |product, n| product * n } #=> 151200
# # # # # find the longest word
# longest = %w[cat sheep bear].inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# puts longest #=> "sheep"

# ## Testing .my_map

# puts 'Original: '
# p (1..4).map { |i| i * i } #=> [1, 4, 9, 16]
# p (1..4).map { 'cat' } #=> ["cat", "cat", "cat", "cat"]

# puts 'Original: '

# p (1..4).map { |i| i * i } #=> [1, 4, 9, 16]
# p (1..4).map { 'cat' } #=> ["cat", "cat", "cat", "cat"]

# # # #Testing .my_none?
# puts 'Original: '
# puts %w[ant bear cat].none? { |word| word.length == 5 } #=> true
# puts %w[ant bear cat].none? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].none?(/d/) #=> true
# puts [1, 3.14, 42].none?(Float) #=> false
# puts [].none? #=> true
# puts [nil].none? #=> true
# puts [nil, false].none? #=> true
# puts [nil, false, true].none? #=> false

# puts "\n\nNow Mine: "

# puts %w[ant bear cat].my_none? { |word| word.length == 5 } #=> true
# puts %w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].my_none?(/d/) #=> true
# puts [1, 3.14, 42].my_none?(Float) #=> false
# puts [].my_none? #=> true
# puts [nil].my_none? #=> true
# puts [nil, false].my_none? #=> true
# puts [nil, false, true].my_none? #=> false

# # #Testing .my_any?
# puts 'Original: '
# puts %w[ant bear cat].any? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].any? { |word| word.length >= 4 } #=> true
# puts %w[ant bear cat].any?(/d/) #=> false
# puts [nil, true, 99].any?(Integer) #=> true
# puts [nil, true, 99].any? #=> true
# puts [].any? #=> false

# puts "\n\nNow Mine: "
# puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# puts %w[ant bear cat].my_any?(/d/) #=> false
# puts [nil, true, 99].my_any?(Integer) #=> true
# puts [nil, true, 99].my_any? #=> true
# puts [].my_any? #=> false

# ##Testing .my_all?
# puts 'Original: '
# puts %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].all?(/t/) #=> false
# puts [1, 2i, 3.14].all?(Numeric) #=> true
# puts [nil, true, 99].all? #=> false
# puts [].all? #=> true

# puts "\n\nNow Mine: "
# puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].my_all?(/t/) #=> false
# puts [1, 2i, 3.14].my_all?(Numeric) #=> true
# puts [nil, true, 99].my_all? #=> false
# puts [].my_all?

# t_array = Array.new(10) { rand(1..20) }
# print 'original: '
# p t_array

################# Testing count?

# puts 'Default: '
# puts ary = [1, 2, 4, 2]
# puts ary.count #=> 4
# puts ary.count(2) #=> 2
# puts ary.count(&:even?) #=> 3

# puts 'My emum: '

# puts ary = [1, 2, 4, 2]
# puts ary.my_count #=> 4
# puts ary.my_count(2) #=> 2
# puts ary.my_count(&:even?) #=> 3

################# Testing none?
# puts 'Default: '
# puts %w[ant bear cat].none? { |word| word.length < 5 }

# puts 'My emum: '
# puts %w[ant bear cat].my_none? { |word| word.length < 5 }

# default = t_array.none? { |item| item > 19 }

# puts 'Default: '
# p default

# mine = t_array.my_none? { |item| item > 19 }

# puts 'My emum: '
# p mine

################# Testing any?

# default = t_array.any? { |item| item > 19 }

# puts 'default: '
# p default

# mine = t_array.my_any?

# puts 'My emum: '
# p mine

################# Testing all?

# default = t_array.all? { |item| item > 1 }

# puts 'default: '
# p default

# mine = t_array.my_all? { |item| item > 1 }

# puts 'My emum: '
# p mine

################# Testing select

# default = t_array.select(&:odd?)

# puts 'default: '
# p default

# mine = t_array.my_select(&:odd?)

# puts 'mine: '
# p mine

################## Testing each

# t_array.each{ |x|
#     print x*3
#     print ","
# }
# puts
# p t_array

# t_array.my_each{ |x|
#     print x*3
#     print ","
# }

# ################3 Testing each index

# Testing each

# t_array.each_with_index{ |x, i|
#     print x*3
#     i +=1
#     print ":#{i},"

# }
# puts
# p t_array

# t_array.my_each_with_index{ |x, i|
#     print x*3
#     i +=1
#     print ":#{i},"
# }
