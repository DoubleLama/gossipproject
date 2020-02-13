require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cities_show_url
    assert_response :success
  end

  test "should get new" do
    get cities_new_url
    assert_response :success
  end

  test "should get create" do
    get cities_create_url
    assert_response :success
  end

  test "should get index" do
    get cities_index_url
    assert_response :success
  end

  test "should get delete" do
    get cities_delete_url
    assert_response :success
  end

  test "should get edit" do
    get cities_edit_url
    assert_response :success
  end

  test "should get update" do
    get cities_update_url
    assert_response :success
  end

end
