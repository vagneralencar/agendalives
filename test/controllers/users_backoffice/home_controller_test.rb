require 'test_helper'

class UsersBackoffice::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_backoffice_home_index_url
    assert_response :success
  end

end
