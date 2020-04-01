[![hire-badge](https://img.shields.io/badge/Consult%20/%20Hire%20Ikraam-Click%20to%20Contact-brightgreen)](mailto:consult.ikraam@gmail.com) [![Twitter Follow](https://img.shields.io/twitter/follow/GhoorIkraam?label=Follow%20Ikraam%20on%20Twitter&style=social)](https://twitter.com/GhoorIkraam)

# Enumerable-Methods

> Fully grasping the fundementals of any language is essential to becoming an expert. This repositry contains some basic enumerable methods have been recreated and tested according to the ruby [documentation](https://ruby-doc.org/core-2.6.5/Enumerable.html).

The following methods were re-created and named with a ***my_*** prefis:

- [x] .each
- [x] .each_with_index
- [x] .select
- [x] .all?
- [x] .any?
- [x] .none?
- [x] .count
- [x] .map
- [x] .inject

All test were taken from the Ruby [docs](https://ruby-doc.org/core-2.6.5/Enumerable.html) page (where available) to ensure that my_enumerable works exactly the same as the original.

## Built With

- Ruby

## Live Demo with Tests

*All test were taken from the Ruby docs page (where available) to ensure that "my_enumerables" works exactly the same as the original.*

[Live Demo Link](https://repl.it/@iks007/EnumerablesTestBench)

## Getting Started

To get a local copy up and running follow these steps:

### Prerequisites

- Ruby installed on local machine
- A browser (for usage of repl.it)

### Usage

#### Preview and test with repl.it in [Live Demo Link](https://repl.it/@iks007/EnumerablesTestBench)

OR:

- Fork/Clone this project to your local machine
- Open enumarable_methods.rb in your local enviroment and run this code:

``` Ruby

def my_test

puts "All test were taken from the Ruby docs page (where available) to ensure that my_enumerable works exactly the same as the original."
## Test for my_map
puts "\nTesting my_map:"
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
end

##Running my_test
my_test
```

## Authors

👤 **Ikraam Ghoor**

- Github: [@ikraamg](https://github.com/ikraamg)
- Twitter: [@GhoorIkraam](https://twitter.com/GhoorIkraam)
- LinkedIn: [isghoor](https://linkedin.com/isghoor)
- Email: [consult.ikraam@gmail.com](mailto:consult.ikraam@gmail.com)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ikraamg/Enumerable-Methods/issues)

Start by:

- Forking the project
- Cloning the project to your local machine
- `cd` into the project directory
- Run `git checkout -b your-branch-name`
- Make your contributions
- Push your branch up to your forked repository
- Open a pull request with a detailed description to the development(or master if not available) branch of the original project for a review

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- The Odin project for the project plan
- Ruby [docs](https://ruby-doc.org/core-2.6.5/Enumerable.html) for detailed code behavior and tests

## 📝 License

This project is [MIT](LICENSE) licensed
