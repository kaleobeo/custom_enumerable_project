module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    index = 0
    for item in self
      block.call(item, index)
      index += 1
    end
    self
  end

  def my_select(&block)
    output_array = []
    my_each do |item|
      output_array << item if block.call(item)
    end
    output_array
  end

  def my_all?(&block)
    all_true = true
    my_each do |item|
      all_true = false unless block.call(item)
    end
    all_true
  end

  def my_any?(&block)
    any_true = false
    my_each do |item|
      any_true = true if block.call(item)
    end
    any_true
  end

  def my_none?(&block)
    none_true = true
    my_each do |item|
      none_true = false if block.call(item)
    end
    none_true
  end

  def my_count(&block)
    count = 0
    my_each do |item|
      count += 1 if (block_given? && block.call(item)) || !block_given?
    end
    count
  end

  def my_map(&block)
    output_array = []
    my_each do |item|
      output_array << block.call(item)
    end
    output_array
  end

  
  def my_inject(initial = nil)
    accumulator = initial
    my_each do |item|
      accumulator = yield(accumulator, item)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    for item in self
      block.call(item)
    end
    self
  end
end
