module Enumerable
  def my_each
    return to_enum unless block_given?

    i = 0
    while i <= length - 1
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    while i <= length - 1
      yield(self[i], i)
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

  def my_all?
    return to_enum unless block_given?

    true_flag = true
    my_each do |val|
      true_flag = false unless yield(val)
    end
    true_flag
  end

  def my_any?
    return to_enum unless block_given?

    true_flag = false
    my_each do |val|
      true_flag = true if yield(val)
    end
    true_flag
  end

  def my_none?
    return to_enum unless block_given?

    none_flag = true
    my_each do |val|
      none_flag = false if yield(val)
    end
    none_flag
  end

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
end

t_array = Array.new(10) { rand(1..20) }
print 'original: '
p t_array

################# Testing count?

default = t_array.count

puts 'default: '
p default

mine = t_array.my_count

puts 'My emum: '
p mine

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
