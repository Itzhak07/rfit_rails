require 'test_helper'

class MovementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movements_index_url
    assert_response :success
  end

  test "should get create" do
    get movements_create_url
    assert_response :success
  end

  test "should get show" do
    get movements_show_url
    assert_response :success
  end

  test "should get update" do
    get movements_update_url
    assert_response :success
  end

  test "should get destroy" do
    get movements_destroy_url
    assert_response :success
  end

end
