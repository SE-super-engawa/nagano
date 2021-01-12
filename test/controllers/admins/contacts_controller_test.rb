require 'test_helper'

class Admins::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admins_contacts_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_contacts_update_url
    assert_response :success
  end

end
