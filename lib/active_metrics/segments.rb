module ActiveMetrics
  class Segments
    @segments = {}
    def self.add(name, &block)
      @segments[name] = block
    end

    def self.get(name)
      # TODO: check for nil || exception
      @segments[name].call
    end
  end
end
