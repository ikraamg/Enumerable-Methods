module Enumerable
  def my_each
    each do |val|
      yield(val)
    end
  end

  def my_each_with_index
    i = 0
    while i <= length - 1
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    output_arr = []
    my_each do |val|
      criteria = yield(val)
      output_arr.push(val) if criteria
    end
    output_arr
  end
end

t_array = Array.new(10) { rand(1..20) }
print 'original: '
p t_array

################# Testing select

default = t_array.select(&:even?)

puts 'default: '
p default

mine = t_array.my_select(&:even?)

puts 'mine: '
p mine

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
