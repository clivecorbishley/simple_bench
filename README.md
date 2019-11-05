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
gem 'simple_bench'

# Command Line
$ gem install simple_bench
```

## Usage

### Basic

My use case when creating this gem was when we were benchmarking two different solutions both using services, so that's what I'll show in this example.

```ruby
# Wrap the methods so they're easy to call

def old_fetch_service
  FetchService.new.fetch
end

def new_fetch_service
  NewFetchService.new.fetch
end

SimpleBench.simple('old_fetch_service', 'new_subscriber_service')
```

### With Variables

In this case, it's probably best to just use instance variables like in the example below

```ruby
@user = user

def old_subscriber_service
  SubscriberService.new(@user).create_subscriber
end

def new_subscriber_service
  NewSubscriberService.new(@user).create_subscriber
end

SimpleBench.simple('old_subscriber_service', 'new_subscriber_service')
```

### Multiple Methods

No problem, it's expecting as many methods as you'd like to pass to it.

```ruby
def one
  100 * 100
end

def two
  200 * 200
end

def three
  300 * 300
end

SimpleBench.simple('one', 'two', 'three')
SimpleBench.simple('one', 'two')
SimpleBench.simple('two')

# All of the above will work.
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
SimpleBench.simple('method_one', 'method_two', 'method_three', 'method_four')
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
SimpleBench.n_times('method_one', 'method_two', 'method_three', 'method_four', 150)
```

### .tiered

Takes method names as strings and then runs each method once, 1_000 times, 20_000, and 75_000 times respectively

```ruby
# Example
def method_one
  # Call code you want to run
end

def method_two
  # Call code you want to run
end

SimpleBench.tiered('method_one', 'method_two')
SimpleBench.tiered('method_one', 'method_two', 'method_three', 'method_four')
```
