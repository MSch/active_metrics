module ActiveMetrics
  @reports = []

  def self.report(&block)
    self.instance_eval &block
  end

  def self.define_segment(name, &block)
    Segments.add(name, &block)
  end

  def self.define_kpi(name, &block)
    KPIs.add(name, &block)
  end

  def self.cohort_table(name, &block)
    cohort_table = CohortTable.new name
    cohort_table.instance_eval &block
    @reports << cohort_table
  end

  def self.reports
    @reports
  end

  def self.reset
    @reports = []
  end

  def self.root
    @root ||= File.expand_path("../../", __FILE__)
  end
end

require 'active_metrics/engine'

