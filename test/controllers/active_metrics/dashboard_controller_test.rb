require 'test_helper'

module ActiveMetrics
  class DashboardControllerTest < ActionController::TestCase
    test "should get welcome" do
      get :welcome
      assert_response :success
    end

  end
end
