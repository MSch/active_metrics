require "active_metrics/engine"

require "active_metrics/kpis"
require "active_metrics/segments"
require "active_metrics/cohort_table"

require "active_metrics/load_reports"

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
    puts "lkflsdkf"
    @reports
  end

  def self.reset
    @reports = []
  end
end

require 'active_metrics/load_reports'