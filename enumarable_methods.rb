# rubocop: disable Metrics/ModuleLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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

  # rubocop: disable Style/CaseEquality, Style/IfInsideElse
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

  def my_map(&arg)
    return to_enum if arg.nil? && block_given? == false

    output_arr = []
    my_each do |val|
      if arg.nil? == false
        output_arr.push(yield(val))
      else
        output_arr.push(arg.call(val))
      end
    end
    output_arr
  end

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
  arr.my_inject('*')
end
