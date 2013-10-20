class MetricsController < ApplicationController
  def show


    @table = ActiveMetrics.results[0].to_h
  end
end
