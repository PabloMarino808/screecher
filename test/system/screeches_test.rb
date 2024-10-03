require "application_system_test_case"

class ScreechesTest < ApplicationSystemTestCase
  setup do
    @screech = screeches(:one)
  end

  test "visiting the index" do
    visit screeches_url
    assert_selector "h1", text: "Screeches"
  end

  test "should create screech" do
    visit screeches_url
    click_on "New screech"

    fill_in "Description", with: @screech.description
    fill_in "Username", with: @screech.username
    click_on "Create Screech"

    assert_text "Screech was successfully created"
    click_on "Back"
  end

  test "should update Screech" do
    visit screech_url(@screech)
    click_on "Edit this screech", match: :first

    fill_in "Description", with: @screech.description
    fill_in "Username", with: @screech.username
    click_on "Update Screech"

    assert_text "Screech was successfully updated"
    click_on "Back"
  end

  test "should destroy Screech" do
    visit screech_url(@screech)
    click_on "Destroy this screech", match: :first

    assert_text "Screech was successfully destroyed"
  end
end
