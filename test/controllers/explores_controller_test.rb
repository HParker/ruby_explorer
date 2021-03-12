require "test_helper"

class ExploresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @explore = explores(:one)
  end

  test "should get index" do
    get explores_url
    assert_response :success
  end

  test "should get new" do
    get new_explore_url
    assert_response :success
  end

  test "should create explore" do
    assert_difference('Explore.count') do
      post explores_url, params: { explore: {  } }
    end

    assert_redirected_to explore_url(Explore.last)
  end

  test "should show explore" do
    get explore_url(@explore)
    assert_response :success
  end

  test "should get edit" do
    get edit_explore_url(@explore)
    assert_response :success
  end

  test "should update explore" do
    patch explore_url(@explore), params: { explore: {  } }
    assert_redirected_to explore_url(@explore)
  end

  test "should destroy explore" do
    assert_difference('Explore.count', -1) do
      delete explore_url(@explore)
    end

    assert_redirected_to explores_url
  end
end
