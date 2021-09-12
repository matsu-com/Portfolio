require "test_helper"

class VegetablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vegetables_index_url
    assert_response :success
  end

  test "should get show" do
    get vegetables_show_url
    assert_response :success
  end

  test "should get new" do
    get vegetables_new_url
    assert_response :success
  end

  test "should get edit" do
    get vegetables_edit_url
    assert_response :success
  end
end
