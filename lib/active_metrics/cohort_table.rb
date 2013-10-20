module ActiveMetrics
  class CohortTable
    def initialize(name)
      @name = name
      @displays = []
    end

    def display(displays)
      @displays = displays
    end

    def segment_by(segment)
      @segment = segment
    end

    def generate_to_h
      segments = Segments.get(@segment)
      segments.map do |segment|
        data = { segment: segment }
        @displays.each do |d|
          data[d] = KPIs.get(d, segment)
        end
        data
      end
    end
  end
end
