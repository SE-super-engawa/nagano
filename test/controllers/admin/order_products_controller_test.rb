require 'test_helper'

class Admin::OrderProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_order_products_update_url
    assert_response :success
  end

end
