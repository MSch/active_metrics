Usertastic::Application.routes.draw do
  mount ActiveMetrics::Engine, at: "/metrics"
end
