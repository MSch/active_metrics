module ActiveMetrics
  class Engine < ::Rails::Engine
    isolate_namespace ActiveMetrics
    config.autoload_paths << File.join(ActiveMetrics.root, 'lib')
  end
end
