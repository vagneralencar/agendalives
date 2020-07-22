require 'test_helper'

class AdminsBackoffice::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_home_index_url
    assert_response :success
  end

end
