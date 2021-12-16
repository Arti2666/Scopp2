require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get matches" do
    get projects_matches_url
    assert_response :success
  end

end
