require 'test_helper'

class WorkSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_sets_index_url
    assert_response :success
  end

  test "should get create" do
    get work_sets_create_url
    assert_response :success
  end

  test "should get show" do
    get work_sets_show_url
    assert_response :success
  end

  test "should get update" do
    get work_sets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get work_sets_destroy_url
    assert_response :success
  end

end
