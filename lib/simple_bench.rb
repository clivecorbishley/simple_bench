# frozen_string_literal: true

# Implementation of SimpleBench gem
module SimpleBench
  class << self
    # Expects Strings. Runs each method once.
    def simple(*methods)
      Benchmark.bmbm do |x|
        methods.each do |method|
          x.report("#{method}_once") { send(method) }
        end
      end
    end

    # Expects Strings. Runs each method once, and then as many times as specified
    def n_times(*methods, number_of_times)
      Benchmark.bmbm do |x|
        methods.each do |method|
          x.report("#{method}_once") { send(method) }
        end

        run_multiple_times(x, number_of_times, methods)
      end
    end

    # Expects Strings. Runs each method once, and then 1_000 times, 20_000 times,
    # and 75_000 times
    def tiered(*methods)
      Benchmark.bmbm do |x|
        tiers = [1_000, 20_000, 75_000]

        methods.each do |method|
          x.report("#{method}_once") { send(method) }
        end

        tiers.each do |tier|
          run_multiple_times(x, tier, methods)
        end
      end
    end

    private

    def run_multiple_times(x, number_of_times, methods)
      methods.each do |method|
        x.report("#{method}_#{number_of_times}_times") do
          number_of_times.times { send(method) }
        end
      end
    end
  end
end
