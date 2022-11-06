require "test_helper"

class OrdersDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get orders_details_update_url
    assert_response :success
  end
end
