module SimpleBench
  class << self
    def simple(method_1, method_2)
      Benchmark.bmbm do |x|
        x.report("#{method_1}_once") { send(method_1) }
        x.report("#{method_2}_once") { send(method_2) }
      end
    end

    def n_times(method_1, method_2, n)
      Benchmark.bmbm do |x|
        x.report("#{method_1}_once") { send(method_1) }
        x.report("#{method_2}_once") { send(method_2) }
        x.report("#{method_1}_#{n}_times") { n.times { send(method_1) } }
        x.report("#{method_2}_#{n}_times") { n.times { send(method_2) } }
      end
    end

    def tiered(method_1, method_2)
      Benchmark.bmbm do |x|
        x.report("#{method_1}_once") { send(method_1) }
        x.report("#{method_2}_once") { send(method_2) }

        n = 1_000
        x.report("#{method_1}_#{n}_times") { n.times { send(method_1) } }
        x.report("#{method_2}_#{n}_times") { n.times { send(method_2) } }

        n = 10_000
        x.report("#{method_1}_#{n}_times") { n.times { send(method_1) } }
        x.report("#{method_2}_#{n}_times") { n.times { send(method_2) } }

        n = 100_000
        x.report("#{method_1}_#{n}_times") { n.times { send(method_1) } }
        x.report("#{method_2}_#{n}_times") { n.times { send(method_2) } }
      end
    end
  end
end
