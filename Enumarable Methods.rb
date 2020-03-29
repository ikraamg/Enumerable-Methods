module Enumarable
 
    def my_each

    end

end

t_array = Array.new(5){rand(1..10)}
p t_array

t_array.each{ |x|
    print x*3
    print ","
}
puts
print t_array

t_array.my_each{ |x|
    print x*3
    print ","
}