module ActiveMetrics
  class Engine < ::Rails::Engine
    isolate_namespace ActiveMetrics
    config.autoload_paths << File.expand_path("../../", __FILE__)
  end
end
