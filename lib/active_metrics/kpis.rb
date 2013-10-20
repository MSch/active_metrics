module ActiveMetrics
  class KPIs
    @kpis = {}
    def self.add(name, &block)
      @kpis[name] = block
    end

    def self.get(name, segment)
      @kpis[name].call(segment)
    end
  end
end
