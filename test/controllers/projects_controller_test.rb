require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get Boards" do
    get projects_Boards_url
    assert_response :success
  end

  test "should get Tasks" do
    get projects_Tasks_url
    assert_response :success
  end

  test "should get Teams" do
    get projects_Teams_url
    assert_response :success
  end
end
