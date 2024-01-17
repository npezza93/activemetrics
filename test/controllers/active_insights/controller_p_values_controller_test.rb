# frozen_string_literal: true

require "test_helper"

class ActiveInsights::ControllerPValuesControllerTest <
  ActionDispatch::IntegrationTest

  test "#index" do
    Time.use_zone("Eastern Time (US & Canada)") do
      get active_insights.controller_p_values_path(
        Date.current, "ActiveInsights::ControllerPValuesController#index"
      )

      assert_response :success
    end
  end

  test "#redirection" do
    get active_insights.controller_p_values_redirection_path(
      "ActiveInsights::ControllerPValuesController#index"
    ), params: { date: Date.new(2025, 1, 4) }

    assert_redirected_to active_insights.controller_p_values_path(
      Date.new(2025, 1, 4), "ActiveInsights::ControllerPValuesController#index"
    )
  end
end
