module ActiveMetrics
  class LoadReports < Rails::Railtie
    initializer "Load report files" do
      ActiveSupport.on_load(:action_controller) do
        reports_path = "#{Rails.root}/app/reports/"

        unless Dir[reports_path] == nil
          Dir["#{reports_path}*.rb"].each do |file|
            require file
          end
        end
      end
    end
  end
end