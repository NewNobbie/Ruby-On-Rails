require "test_helper"

class Api::V1::ItemReportsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @item_report = item_reports(:one) # Ensure the correct naming of the fixture
  end

  test "should get index" do
    get api_v1_item_reports_url, as: :json
    assert_response :success
    assert_instance_of Array, JSON.parse(response.body)
  end

  test "should show item report" do
    get api_v1_item_report_url(@item_report), as: :json # Use singular for specific record
    assert_response :success
    assert_equal @item_report.item_name, JSON.parse(response.body)["item_name"]
  end

  test "should create item report with valid parameters" do
    assert_difference('ItemReport.count') do
      post api_v1_item_reports_url, params: { item_report: { item_name: "New Item", report_count: 2, last_reported_at: DateTime.now, status: "Available" } }, as: :json
    end
    assert_response :created
  end

  test "should handle email failure and not create item report" do
    ItemReportMailer.any_instance.stubs(:new_report_email).raises(StandardError, "Email Error")
    assert_no_difference('ItemReport.count') do
      post api_v1_item_reports_url, params: { item_report: { item_name: "Failing Item", report_count: 2, last_reported_at: DateTime.now, status: "Available" } }, as: :json
    end
    assert_response :unprocessable_entity
    assert_includes JSON.parse(response.body)["error"], "Mail sending failed"
  end

  test "should update item report" do
    patch api_v1_item_report_url(@item_report), params: { item_report: { status: "Updated" } }, as: :json
    assert_response :success
    @item_report.reload
    assert_equal "Updated", @item_report.status
  end

  test "should destroy item report" do
    assert_difference('ItemReport.count', -1) do
      delete api_v1_item_report_url(@item_report), as: :json
    end
    assert_response :no_content
  end
end
