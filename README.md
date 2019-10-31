# simple_bench
A simple wrapper for Ruby's Benchmarking

## Description
This is just intended to be a simple wrapper to help with using Ruby's Benchmarking features while in `rails c` or `irb`.

Please have a look at the actual Ruby documentation, as it's pretty great:
https://ruby-doc.org/stdlib-2.5.3/libdoc/benchmark/rdoc/Benchmark.html

This gem uses the `.bmbm` method

## Installation

```ruby
# Gemfile
gem 'simple_bench', '0.0.2'

# Command Line
$ gem install simple_bench
```

## Methods

### .simple

Takes method names as strings, and runs each method once

```ruby
# Example
def method_one
  # Call code you want to run
end

def method_two
  # Call code you want to run
end

SimpleBench.simple('method_one', 'method_two')
```

### .n_times

Takes method names as strings, and number of times for each to be run

```ruby
# Example
def method_one
  # Call code you want to run
end

def method_two
  # Call code you want to run
end

SimpleBench.n_times('method_one', 'method_two', 150)
```

### .tiered

Takes method names as strings and then runs each method once, 1_000 times, 10_000, and 100_000 times respectively

```ruby
# Example
def method_one
  # Call code you want to run
end

def method_two
  # Call code you want to run
end

SimpleBench.tiered('method_one', 'method_two')
```
