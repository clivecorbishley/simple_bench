# simple_bench
A simple wrapper for Ruby's Benchmarking

## Description
This is just intended to be a simple wrapper to help with using Ruby's Benchmarking features while in `rails c` or `irb`.

Please have a look at the actual Ruby documentation, as it's pretty great:
https://ruby-doc.org/stdlib-2.5.3/libdoc/benchmark/rdoc/Benchmark.html

This gem uses the `.bmbm` method

## Methods

### .simple

```ruby
# Example
def method_one
  # Call code you want to run
end

def method_two
  # Call code you want to run
end

# Takes method names as strings
SimpleBench.simple('method_one', 'method_two')
```

### .n_times

```ruby
# Example
def method_one
  # Call code you want to run
end

def method_two
  # Call code you want to run
end

# Takes method names as strings, and number of times to be run
SimpleBench.n_times('method_one', 'method_two', 150)
```

### .tiered

```ruby
# Example
def method_one
  # Call code you want to run
end

def method_two
  # Call code you want to run
end

# Takes method names as strings and then runs once, 1_000 times, 10_000, and 100_000 times
SimpleBench.tiered('method_one', 'method_two')
```
