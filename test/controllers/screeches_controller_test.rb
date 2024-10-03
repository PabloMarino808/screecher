require "test_helper"

class ScreechesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @screech = screeches(:one)
  end

  test "should get index" do
    get screeches_url
    assert_response :success
  end

  test "should get new" do
    get new_screech_url
    assert_response :success
  end

  test "should create screech" do
    assert_difference("Screech.count") do
      post screeches_url, params: { screech: { description: @screech.description, username: @screech.username } }
    end

    assert_redirected_to screech_url(Screech.last)
  end

  test "should show screech" do
    get screech_url(@screech)
    assert_response :success
  end

  test "should get edit" do
    get edit_screech_url(@screech)
    assert_response :success
  end

  test "should update screech" do
    patch screech_url(@screech), params: { screech: { description: @screech.description, username: @screech.username } }
    assert_redirected_to screech_url(@screech)
  end

  test "should destroy screech" do
    assert_difference("Screech.count", -1) do
      delete screech_url(@screech)
    end

    assert_redirected_to screeches_url
  end
end
